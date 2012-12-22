//
//  EVEDBInvType.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvType.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvGroup.h"
#import "EVEDBInvMarketGroup.h"
#import "EVEDBDgmTypeAttribute.h"
#import "EVEDBDgmAttributeType.h"
#import "EVEDBDgmAttributeCategory.h"
#import "EVEDBDgmEffect.h"
#import "EVEDBDgmTypeEffect.h"
#import "EVEDBEveIcon.h"
#import "EVEDBCrtRecommendation.h"
#import "EVEDBInvType+Skill.h"
#import "EVEDBInvTypeMaterial.h"
#import "EVEDBInvBlueprintType.h"


@implementation EVEDBInvTypeAttributeCategory
@synthesize publishedAttributes;
@synthesize unpublishedAttributes;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		self.publishedAttributes = [NSMutableArray array];
		self.unpublishedAttributes = [NSMutableArray array];
	}
	return self;
}

- (void) dealloc {
	[publishedAttributes release];
	[unpublishedAttributes release];
	[super dealloc];
}

- (NSComparisonResult) compare:(EVEDBInvTypeAttributeCategory*) other {
	if (self.categoryID > other.categoryID)
		return NSOrderedDescending;
	else if (self.categoryID < other.categoryID)
		return NSOrderedAscending;
	else
		return NSOrderedSame;
}

@end


@interface EVEDBInvType(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
- (void) didReceiveAttribute: (NSDictionary*) attribute;
- (void) didReceiveEffect: (NSDictionary*) effect;
- (void) didReceiveRecommendation:(NSDictionary*) record;
- (void) loadAttributes;
- (void) loadEffects;
- (void) loadCertificateRecommendations;
@end

@implementation EVEDBInvType(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.typeID = [[dictionary valueForKey:@"typeID"] integerValue];
	self.groupID = [[dictionary valueForKey:@"groupID"] integerValue];
	self.typeName = [dictionary valueForKey:@"typeName"];
	//self.description = [dictionary valueForKey:@"description"];
	self.graphicID = [[dictionary valueForKey:@"graphicID"] integerValue];
	self.radius = [[dictionary valueForKey:@"radius"] floatValue];
	self.mass = [[dictionary valueForKey:@"mass"] floatValue];
	self.volume = [[dictionary valueForKey:@"volume"] floatValue];
	self.capacity = [[dictionary valueForKey:@"capacity"] floatValue];
	self.portionSize = [[dictionary valueForKey:@"portionSize"] integerValue];
	self.raceID = [[dictionary valueForKey:@"raceID"] integerValue];
	self.basePrice = [[dictionary valueForKey:@"basePrice"] floatValue];
	self.published = [[dictionary valueForKey:@"published"] integerValue];
	self.marketGroupID = [[dictionary valueForKey:@"marketGroupID"] integerValue];
	self.chanceOfDuplicating = [[dictionary valueForKey:@"chanceOfDuplicating"] floatValue];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.imageName = [dictionary valueForKey:@"imageName"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

- (void) didReceiveAttribute: (NSDictionary*) attribute {
	EVEDBDgmTypeAttribute *typeAttribute = [EVEDBDgmTypeAttribute dgmTypeAttributeWithDictionary:attribute];
	EVEDBDgmAttributeType *attributeType = [EVEDBDgmAttributeType dgmAttributeTypeWithDictionary:attribute];
	EVEDBDgmAttributeCategory *attributeCategory = [EVEDBDgmAttributeCategory dgmAttributeCategoryWithDictionary:attribute];
	EVEDBInvTypeAttributeCategory *category = nil;
	for (EVEDBInvTypeAttributeCategory *cat in attributeCategories) {
		if (cat.categoryID == attributeCategory.categoryID) {
			category = cat;
			break;
		}
	}
	if (!category) {
		category = [[[EVEDBInvTypeAttributeCategory alloc] initWithDictionary:attribute] autorelease];
		[attributeCategories addObject:category];
	}
	if (attributeType.published)
		[category.publishedAttributes addObject:typeAttribute];
	else
		[category.unpublishedAttributes addObject:typeAttribute];
	
	[typeAttribute setAttribute:attributeType];
	[attributeType setCategory:attributeCategory];
	[attributesDictionary setValue:typeAttribute forKey:[NSString stringWithFormat:@"%d", attributeType.attributeID]];
}

- (void) didReceiveEffect: (NSDictionary*) record {
	EVEDBDgmTypeEffect *typeEffect = [EVEDBDgmTypeEffect dgmTypeEffectWithDictionary:record];
	EVEDBDgmEffect *effect = [EVEDBDgmEffect dgmEffectWithDictionary:record];

	[typeEffect setEffect:effect];
	[effectsDictionary setValue:typeEffect forKey:[NSString stringWithFormat:@"%d", effect.effectID]];
}

- (void) didReceiveRecommendation:(NSDictionary*) record {
	EVEDBCrtRecommendation* recommendation = [EVEDBCrtRecommendation crtRecommendationWithDictionary:record];
	[certificateRecommendations addObject:recommendation];
}

- (void) loadAttributes {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	attributeCategories = [[NSMutableArray alloc] init];
	attributesDictionary = [[NSMutableDictionary alloc] init];
	
	[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM dgmTypeAttributes, dgmAttributeTypes, dgmAttributeCategories WHERE dgmAttributeTypes.attributeID=dgmTypeAttributes.attributeID AND dgmAttributeCategories.categoryID=dgmAttributeTypes.categoryID AND typeID=%d;", typeID]
						  target:self
						  action:@selector(didReceiveAttribute:)];
	[attributeCategories sortUsingSelector:@selector(compare:)];
}

- (void) loadEffects {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	effectsDictionary = [[NSMutableDictionary alloc] init];
	
	[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM dgmTypeEffects, dgmEffects WHERE dgmTypeEffects.effectID=dgmEffects.effectID AND typeID=%d;", typeID]
						  target:self
						  action:@selector(didReceiveEffect:)];
}

- (void) loadCertificateRecommendations {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	certificateRecommendations = [[NSMutableArray alloc] init];
	
	[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRecommendations WHERE shipTypeID=%d;", typeID]
						  target:self
						  action:@selector(didReceiveRecommendation:)];
}

@end


@implementation EVEDBInvType
@synthesize typeID;
@synthesize groupID;
@synthesize group;
@synthesize typeName;
@synthesize description;
@synthesize graphicID;
@synthesize radius;
@synthesize mass;
@synthesize volume;
@synthesize capacity;
@synthesize portionSize;
@synthesize raceID;
@synthesize basePrice;
@synthesize published;
@synthesize marketGroupID;
@synthesize marketGroup;
@synthesize chanceOfDuplicating;
@synthesize iconID;
@synthesize icon;
@synthesize imageName;
@synthesize attributeCategories;
@synthesize attributesDictionary;
@synthesize effectsDictionary;
@synthesize certificateRecommendations;
@synthesize requiredSkills;
@synthesize blueprintType;
@synthesize blueprint;

+ (id) invTypeWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr {
	return [[[self alloc] initWithTypeID:aTypeID error:errorPtr] autorelease];
}

+ (id) invTypeWithDictionary: (NSDictionary*) dictionary {
	return [[[self alloc] initWithDictionary:dictionary] autorelease];
}

+ (id) invTypeWithInvType:(EVEDBInvType*) type {
	return [[[self alloc] initWithInvType:type] autorelease];
}

- (id) initWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invTypes WHERE typeID=%d;", aTypeID]
											   target:self
											   action:@selector(didReceiveRecord:)];
		if (error) {
			if (errorPtr)
				*errorPtr = error;
			[self release];
			return nil;
		}
	}
	return self;
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (id) initWithInvType:(EVEDBInvType*) type {
	if (self = [super init]) {
		self.typeID = type.typeID;
		self.groupID = type.groupID;
		self.typeName = type.typeName;
		self.description = type.description;
		self.graphicID = type.graphicID;
		self.radius = type.radius;
		self.mass = type.mass;
		self.volume = type.volume;
		self.capacity = type.capacity;
		self.portionSize = type.portionSize;
		self.raceID = type.raceID;
		self.basePrice = type.basePrice;
		self.published = type.published;
		self.marketGroupID = type.marketGroupID;
		self.chanceOfDuplicating = type.chanceOfDuplicating;
		self.iconID = type.iconID;
		self.imageName = type.imageName;
		
		self.group = type->group;
		self.marketGroup = type->marketGroup;
		self.icon = type->icon;
		
		self.attributeCategories = type->attributeCategories;
		self.effectsDictionary = type->effectsDictionary;
		self.attributesDictionary = type->attributesDictionary;
		self.effectsDictionary = type->effectsDictionary;
		self.certificateRecommendations = type->certificateRecommendations;
	}
	return self;
}

- (EVEDBInvGroup*) group {
	if (groupID == 0)
		return NULL;
	if (!group) {
		group = [[EVEDBInvGroup invGroupWithGroupID:groupID error:nil] retain];
		if (!group)
			group = (EVEDBInvGroup*) [[NSNull null] retain];
	}
	if ((NSNull*) group == [NSNull null])
		return NULL;
	else
		return group;
}

- (EVEDBInvMarketGroup*) marketGroup {
	if (marketGroupID == 0)
		return NULL;
	if (!marketGroup) {
		marketGroup = [[EVEDBInvMarketGroup invMarketGroupWithMarketGroupID:marketGroupID error:nil] retain];
		if (!marketGroup)
			marketGroup = (EVEDBInvMarketGroup*) [[NSNull null] retain];
	}
	if ((NSNull*) marketGroup == [NSNull null])
		return NULL;
	else
		return marketGroup;
}

- (EVEDBEveIcon*) icon {
	if (iconID == 0)
		return NULL;
	if (!icon) {
		icon = [[EVEDBEveIcon eveIconWithIconID:iconID error:nil] retain];
		if (!icon)
			icon = (EVEDBEveIcon*) [[NSNull null] retain];
	}
	if ((NSNull*) icon == [NSNull null])
		return NULL;
	else
		return icon;
}

- (NSMutableArray*) attributeCategories {
	if (!attributeCategories) {
		[self loadAttributes];
	}
	return attributeCategories;
}

- (NSMutableDictionary*) attributesDictionary {
	if (!attributesDictionary) {
		[self loadAttributes];
	}
	return attributesDictionary;
}

- (NSMutableDictionary*) effectsDictionary {
	if (!effectsDictionary) {
		[self loadEffects];
	}
	return effectsDictionary;
}

- (NSMutableArray*) certificateRecommendations {
	if (!certificateRecommendations) {
		[self loadCertificateRecommendations];
	}
	return certificateRecommendations;
}

- (NSString*) typeLargeImageName {
	if (!imageName) {
		if (self.icon.iconImageName && [[NSBundle mainBundle] pathForResource:self.icon.iconImageName ofType:nil])
			return self.icon.iconImageName;
		else
			return @"Icons/icon74_14.png";
	}
	else {
		//NSString *imageName = [NSString stringWithFormat:@"Types/%d.png", typeID];
		NSString *fileName = [NSString stringWithFormat:@"Types/%@.png", imageName];
		if ([[NSBundle mainBundle] pathForResource:fileName ofType:nil])
			return fileName;
		else
			return @"Icons/icon74_14.png";
	}
}

- (NSString*) typeSmallImageName {
	if (!imageName) {
		if (self.icon.iconImageName && [[NSBundle mainBundle] pathForResource:self.icon.iconImageName ofType:nil])
			return self.icon.iconImageName;
		else
			return @"Icons/icon74_14.png";
	}
	else {
		//NSString *imageName = [NSString stringWithFormat:@"Types/%d.png", typeID];
		NSString *fileName = [NSString stringWithFormat:@"Types/%@.png", imageName];
		if ([[NSBundle mainBundle] pathForResource:fileName ofType:nil])
			return fileName;
		else
			return @"Icons/icon74_14.png";
	}
	
/*	if (self.icon.iconImageName)
		return self.icon.iconImageName;
	else
		return [NSString stringWithFormat:@"%d.png", typeID];*/
}

- (void) dealloc {
	[group release];
	[typeName release];
	[description release];
	[marketGroup release];
	[icon release];
	[imageName release];
	[attributeCategories release];
	[attributesDictionary release];
	[effectsDictionary release];
	[certificateRecommendations release];
	[requiredSkills release];
	[blueprint release];
	[super dealloc];
}

- (BOOL) isEqual:(id)object {
	return [object isKindOfClass:[self class]] && typeID == [object typeID];
}

- (NSUInteger) hash {
	return typeID;
}

- (NSMutableArray*) requiredSkills {
	if (!requiredSkills) {
		requiredSkills = [[NSMutableArray alloc] init];
		NSArray* requirementIDs = [NSArray arrayWithObjects:@"182", @"183", @"184", @"1285", @"1289", @"1290", nil];
		NSArray* skillLevelIDs = [NSArray arrayWithObjects:@"277", @"278", @"279", @"1286", @"1287", @"1288", nil];
		for (int i = 0; i < 5; i++) {
			EVEDBDgmTypeAttribute* attributeTypeID = [self.attributesDictionary valueForKey:[requirementIDs objectAtIndex:i]];
			if (attributeTypeID) {
				EVEDBDgmTypeAttribute* attributeLevel = [self.attributesDictionary valueForKey:[skillLevelIDs objectAtIndex:i]];
				EVEDBInvTypeRequiredSkill* skill = [EVEDBInvTypeRequiredSkill invTypeWithTypeID:(NSInteger) attributeTypeID.value error:nil];
				if (skill) {
					skill.requiredLevel = attributeLevel.value;
					[requiredSkills addObject:skill];
				}
			}
		}
	}
	return requiredSkills;
}

- (EVEDBInvBlueprintType*) blueprintType {
	if (!blueprintType) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invBlueprintTypes WHERE blueprintTypeID=%d;", typeID]
							 resultBlock:^(NSDictionary *record, BOOL *needsMore) {
								 blueprintType = [[EVEDBInvBlueprintType alloc] initWithDictionary:record];
								 blueprintType.blueprintType = self;
								 *needsMore = NO;
							 }];
		}
		if (!blueprintType)
			blueprintType = (EVEDBInvBlueprintType*) [[NSNull null] retain];
	}
	if ((NSNull*) blueprintType == [NSNull null])
		return NULL;
	else
		return blueprintType;
}

- (EVEDBInvType*) blueprint {
	if (!blueprint) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT a.* FROM invTypes as a, invBlueprintTypes as b WHERE a.typeID=b.blueprintTypeID and b.productTypeID=%d;", typeID]
							 resultBlock:^(NSDictionary *record, BOOL *needsMore) {
								 blueprint = [[EVEDBInvType invTypeWithDictionary:record] retain];
								 *needsMore = NO;
							 }];
		}
		if (!blueprint)
			blueprint = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) blueprint == [NSNull null])
		return NULL;
	else
		return blueprint;
}

- (NSString*) description {
	if (!description) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			return nil;
		}
		[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT description FROM invTypes WHERE typeID=%d;", typeID]
						 resultBlock:^(NSDictionary *record, BOOL *needsMore) {
							 self.description = [record valueForKey:@"description"];
						 }];
	}
	return description;
}

@end

@implementation EVEDBInvTypeRequiredSkill
@synthesize requiredLevel;

- (BOOL) isEqual:(id)object {
	return [object isKindOfClass:[self class]] && typeID == [object typeID] && requiredLevel == [object requiredLevel];
}

- (float) requiredSP {
	if (requiredSP == 0.0 && requiredLevel > 0)
		requiredSP = [self skillpointsAtLevel:requiredLevel];
	return requiredSP;
}

- (void) setRequiredLevel:(NSInteger)value {
	if (requiredLevel != value)
		requiredSP = 0.0;
	requiredLevel = value;
}

@end