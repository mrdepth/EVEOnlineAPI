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
#import "EVEDBCertMastery.h"
#import "EVEDBInvTrait.h"
#import "EVEDBEveUnit.h"
#import <objc/runtime.h>


@implementation EVEDBInvTypeAttributeCategory

- (id) initWithStatement:(sqlite3_stmt *)stmt {
	if (self = [super initWithStatement:stmt]) {
		self.publishedAttributes = [NSMutableArray array];
		self.unpublishedAttributes = [NSMutableArray array];
	}
	return self;
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


@interface EVEDBInvTypeRequiredSkill()
@property (nonatomic, readwrite, assign) float requiredSkillPoints;
@end

@interface EVEDBInvType()
@property (nonatomic, strong, readwrite) NSArray *masteries;
@property (nonatomic, strong, readwrite) NSArray *requiredSkills;
@property (nonatomic, strong, readwrite) NSArray* traits;
@property (nonatomic, strong, readwrite) NSString* traitsString;
@property (nonatomic, strong, readwrite) NSAttributedString* traitsAttributedString;

- (void) loadAttributes;
- (void) loadEffects;
- (void) loadMasteries;
@end




@implementation EVEDBInvType
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"groupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"groupID"},
		  @"typeName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"typeName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"graphicID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"graphicID"},
		  @"radius" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"radius"},
		  @"mass" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"mass"},
		  @"volume" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"volume"},
		  @"capacity" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"capacity"},
		  @"portionSize" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"portionSize"},
		  @"raceID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"raceID"},
		  @"basePrice" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"basePrice"},
		  @"published" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"published"},
		  @"marketGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"marketGroupID"},
		  @"chanceOfDuplicating" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"chanceOfDuplicating"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"imageName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"imageName"}
		  };
	return map;
}

+ (id) invTypeWithTypeID: (int32_t)aTypeID error:(NSError **)errorPtr {
	return [[self alloc] initWithTypeID:aTypeID error:errorPtr];
}

+ (id) invTypeWithInvType:(EVEDBInvType*) type {
	return [[self alloc] initWithInvType:type];
}

- (id) initWithTypeID: (int32_t)aTypeID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invTypes WHERE typeID=%d;", aTypeID] error:errorPtr]) {
	}
	return self;
}

- (id) initWithInvType:(EVEDBInvType*) type {
	if (self = [super init]) {
		if (!type)
			return nil;
		
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
		
		_group = type->_group;
		_marketGroup = type->_marketGroup;
		_icon = type->_icon;
		
		self.attributeCategories = type->_attributeCategories;
		self.effectsDictionary = type->_effectsDictionary;
		self.attributesDictionary = type->_attributesDictionary;
		self.effectsDictionary = type->_effectsDictionary;
		self.masteries = type->_masteries;
	}
	return self;
}

- (EVEDBInvGroup*) group {
	if (self.groupID == 0)
		return nil;
	if (!_group) {
		_group = [EVEDBInvGroup invGroupWithGroupID:self.groupID error:nil];
		if (!_group)
			_group = (EVEDBInvGroup*) [NSNull null];
	}
	if ((NSNull*) _group == [NSNull null])
		return nil;
	else
		return _group;
}

- (EVEDBInvMarketGroup*) marketGroup {
	if (self.marketGroupID == 0)
		return nil;
	if (!_marketGroup) {
		_marketGroup = [EVEDBInvMarketGroup invMarketGroupWithMarketGroupID:self.marketGroupID error:nil];
		if (!_marketGroup)
			_marketGroup = (EVEDBInvMarketGroup*) [NSNull null];
	}
	if ((NSNull*) _marketGroup == [NSNull null])
		return nil;
	else
		return _marketGroup;
}

- (EVEDBEveIcon*) icon {
	if (self.iconID == 0)
		return nil;
	if (!_icon) {
		_icon = [EVEDBEveIcon eveIconWithIconID:self.iconID error:nil];
		if (!_icon)
			_icon = (EVEDBEveIcon*) [NSNull null];
	}
	if ((NSNull*) _icon == [NSNull null])
		return nil;
	else
		return _icon;
}

- (NSMutableArray*) attributeCategories {
	if (!_attributeCategories) {
		[self loadAttributes];
	}
	return _attributeCategories;
}

- (NSMutableDictionary*) attributesDictionary {
	if (!_attributesDictionary) {
		[self loadAttributes];
	}
	return _attributesDictionary;
}

- (NSMutableDictionary*) effectsDictionary {
	if (!_effectsDictionary) {
		[self loadEffects];
	}
	return _effectsDictionary;
}

- (NSArray*) masteries {
	if (!_masteries) {
		[self loadMasteries];
	}
	if ((NSNull*) _masteries == [NSNull null])
		return nil;
	else
		return _masteries;
}

- (NSString*) typeLargeImageName {
	if (!_imageName) {
		if (self.icon.iconImageName && [[NSBundle mainBundle] pathForResource:self.icon.iconImageName ofType:nil])
			return self.icon.iconImageName;
		else
			return @"Icons/icon74_14.png";
	}
	else {
		NSString *fileName = [NSString stringWithFormat:@"Types/%@.png", _imageName];
		if ([[NSBundle mainBundle] pathForResource:fileName ofType:nil])
			return fileName;
		else
			return @"Icons/icon74_14.png";
	}
}

- (NSString*) typeSmallImageName {
	if (!_imageName) {
		if (self.icon.iconImageName && [[NSBundle mainBundle] pathForResource:self.icon.iconImageName ofType:nil])
			return self.icon.iconImageName;
		else
			return @"Icons/icon74_14.png";
	}
	else {
		NSString *fileName = [NSString stringWithFormat:@"Types/%@.png", _imageName];
		if ([[NSBundle mainBundle] pathForResource:fileName ofType:nil])
			return fileName;
		else
			return @"Icons/icon74_14.png";
	}
}

- (BOOL) isEqual:(id)object {
	return [object isKindOfClass:[self class]] && self.hash == [object hash];
}

- (NSUInteger) hash {
	NSNumber* hash = objc_getAssociatedObject(self, @"hash");
	if (!hash) {
		NSUInteger hash = [[NSData dataWithBytes:&_typeID length:sizeof(_typeID)] hash];
		objc_setAssociatedObject(self, @"hash", @(hash), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		return hash;
	}
	else
		return [hash unsignedIntegerValue];
}

- (NSArray*) requiredSkills {
	if (!_requiredSkills) {
		NSMutableArray* requiredSkills = [NSMutableArray new];
		int32_t requirementIDs[] = {182, 183, 184, 1285, 1289, 1290};
		int32_t skillLevelIDs[] = {277, 278, 279, 1286, 1287, 1288};
		for (int i = 0; i < 5; i++) {
			EVEDBDgmTypeAttribute* attributeTypeID = self.attributesDictionary[@(requirementIDs[i])];
			if (attributeTypeID) {
				EVEDBDgmTypeAttribute* attributeLevel = self.attributesDictionary[@(skillLevelIDs[i])];
				EVEDBInvTypeRequiredSkill* skill = [EVEDBInvTypeRequiredSkill invTypeWithTypeID:(int32_t) attributeTypeID.value error:nil];
				if (skill) {
					skill.requiredLevel = attributeLevel.value;
					[requiredSkills addObject:skill];
				}
			}
		}
		_requiredSkills = requiredSkills;
	}
	return _requiredSkills;
}

- (EVEDBInvBlueprintType*) blueprintType {
	if (!_blueprintType) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invBlueprintTypes WHERE blueprintTypeID=%d;", self.typeID]
						 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
							 _blueprintType = [[EVEDBInvBlueprintType alloc] initWithStatement:stmt];
							 //_blueprintType.blueprintType = self;
							 *needsMore = NO;
						 }];
		}
		if (!_blueprintType)
			_blueprintType = (EVEDBInvBlueprintType*) [NSNull null];
	}
	if ((NSNull*) _blueprintType == [NSNull null])
		return nil;
	else
		return _blueprintType;
}

- (EVEDBInvType*) blueprint {
	if (!_blueprint) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execSQLRequest:[NSString stringWithFormat:@"SELECT a.* FROM invTypes as a, invBlueprintTypes as b WHERE a.typeID=b.blueprintTypeID and b.productTypeID=%d;", self.typeID]
						 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
							 _blueprint = [[EVEDBInvType alloc] initWithStatement:stmt];
							 //_blueprint.blueprintType = self;
							 *needsMore = NO;
						 }];
		}
		if (!_blueprint)
			_blueprint = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _blueprint == [NSNull null])
		return nil;
	else
		return _blueprint;
}

- (NSString*) description {
	if (!_description) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			return nil;
		}
		[database execSQLRequest:[NSString stringWithFormat:@"SELECT description FROM invTypes WHERE typeID=%d;", self.typeID]
					 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
						 self.description = [NSString stringWithCString:(const char*) sqlite3_column_text(stmt, 0) encoding:NSUTF8StringEncoding];
						 *needsMore = NO;
					 }];
	}
	return _description;
}

- (NSArray*) traits {
	if (!_traits) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			NSMutableArray* traits = [NSMutableArray new];
			[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invTraits WHERE typeID=%d;", self.typeID]
						 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
							 EVEDBInvTrait* trait = [[EVEDBInvTrait alloc] initWithStatement:stmt];
							 [traits addObject:trait];
						 }];
			_traits = traits;
		}
		if (!_traits)
			_traits = (NSArray*) [NSNull null];
	}
	if ((NSNull*) _traits == [NSNull null])
		return nil;
	else
		return _traits;
}

- (NSString*) traitsString {
	if (!_traitsString) {
		NSArray* traits = self.traits;
		if (traits.count > 0) {
			NSMutableDictionary* sections = [NSMutableDictionary new];
			for (EVEDBInvTrait* trait in traits) {
				NSDictionary* section = sections[@(trait.skillID)];
				if (!section) {
					NSString* title;
					if (trait.skillID > 0) {
						title = [NSString stringWithFormat:NSLocalizedString(@"<b>%@</b> bonuses (per skill level):", nil),
								 trait.skill.typeName ?
								 trait.skill.typeName :
								 [NSString stringWithFormat:NSLocalizedString(@"Unknown skill %d", nil), trait.skillID]];
					}
					else
						title = NSLocalizedString(@"<b>Role Bonus</b>:", nil);
					
					section = @{@"array": [NSMutableArray new], @"title": title};
					sections[@(trait.skillID)] = section;
				}
				[section[@"array"] addObject:trait];
			}
			
			NSRegularExpression* expression = [NSRegularExpression regularExpressionWithPattern:@"(<a*[^>]*>)([^<]*)(</a>)"
																						options:NSRegularExpressionCaseInsensitive
																						  error:nil];
			NSMutableString* html = [NSMutableString new];
			for (NSDictionary* section in [[sections allValues] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]]) {
				[html appendFormat:@"\n%@\n", section[@"title"]];
				for (EVEDBInvTrait* trait in section[@"array"]) {
					if (trait.bonus > 0)
						[html appendFormat:@"<b>%d%@</b> %@\n", trait.bonus, trait.unit.displayName ? trait.unit.displayName : @"", trait.bonusText];
					else
						[html appendFormat:@"<b>-</b> %@\n", trait.bonusText];
				}
			}
			
			[expression replaceMatchesInString:html options:0 range:NSMakeRange(0, html.length) withTemplate:@"<b>$2</b>"];
			_traitsString = html;
		}
	}
	return _traitsString;
}

#pragma mark - Private

- (void) loadAttributes {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	NSMutableDictionary* attributeCategories = [NSMutableDictionary new];
	_attributesDictionary = [NSMutableDictionary new];
	
	[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM dgmTypeAttributes, dgmAttributeTypes, dgmAttributeCategories WHERE dgmAttributeTypes.attributeID=dgmTypeAttributes.attributeID AND dgmAttributeCategories.categoryID=dgmAttributeTypes.categoryID AND typeID=%d;", self.typeID]
				 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
					 EVEDBDgmTypeAttribute *typeAttribute = [[EVEDBDgmTypeAttribute alloc] initWithStatement:stmt];
					 EVEDBDgmAttributeType *attributeType = [[EVEDBDgmAttributeType alloc] initWithStatement:stmt];
					 EVEDBDgmAttributeCategory *attributeCategory = [[EVEDBDgmAttributeCategory alloc] initWithStatement:stmt];
					 EVEDBInvTypeAttributeCategory *category = attributeCategories[@(attributeCategory.categoryID)];
					 if (!category) {
						 category = [[EVEDBInvTypeAttributeCategory alloc] initWithStatement:stmt];
						 attributeCategories[@(category.categoryID)] = category;
					 }
					 if (attributeType.published)
						 [category.publishedAttributes addObject:typeAttribute];
					 else
						 [category.unpublishedAttributes addObject:typeAttribute];
					 
					 [typeAttribute setAttribute:attributeType];
					 [attributeType setCategory:attributeCategory];
					 _attributesDictionary[@(attributeType.attributeID)] = typeAttribute;
				 }];
	
	EVEDBInvTypeAttributeCategory *category = attributeCategories[@(9)];
	if (!category) {
		category = [EVEDBInvTypeAttributeCategory dgmAttributeCategoryWithAttributeCategoryID:9 error:nil];
		attributeCategories[@(9)] = category;
	}
	
	EVEDBDgmTypeAttribute* typeAttribute = [EVEDBDgmTypeAttribute new];
	typeAttribute.typeID = self.typeID;
	typeAttribute.attributeID = 4;
	typeAttribute.value = self.mass;
	[category.publishedAttributes addObject:typeAttribute];

	typeAttribute = [EVEDBDgmTypeAttribute new];
	typeAttribute.typeID = self.typeID;
	typeAttribute.attributeID = 38;
	typeAttribute.value = self.capacity;
	[category.publishedAttributes addObject:typeAttribute];

	typeAttribute = [EVEDBDgmTypeAttribute new];
	typeAttribute.typeID = self.typeID;
	typeAttribute.attributeID = 161;
	typeAttribute.value = self.volume;
	[category.publishedAttributes addObject:typeAttribute];

	typeAttribute = [EVEDBDgmTypeAttribute new];
	typeAttribute.typeID = self.typeID;
	typeAttribute.attributeID = 162;
	typeAttribute.value = self.radius;
	[category.publishedAttributes addObject:typeAttribute];

	if (self.raceID) {
		typeAttribute = [EVEDBDgmTypeAttribute new];
		typeAttribute.typeID = self.typeID;
		typeAttribute.attributeID = 195;
		typeAttribute.value = self.raceID;
		[category.publishedAttributes addObject:typeAttribute];
	}
	
	_attributeCategories = [NSMutableArray arrayWithArray:[attributeCategories allValues]];
	[_attributeCategories sortUsingSelector:@selector(compare:)];
}

- (void) loadEffects {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	_effectsDictionary = [[NSMutableDictionary alloc] init];
	
	[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM dgmTypeEffects, dgmEffects WHERE dgmTypeEffects.effectID=dgmEffects.effectID AND typeID=%d;", self.typeID]
				 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
					 EVEDBDgmTypeEffect *typeEffect = [[EVEDBDgmTypeEffect alloc] initWithStatement:stmt];
					 EVEDBDgmEffect *effect = [[EVEDBDgmEffect alloc] initWithStatement:stmt];
					 
					 [typeEffect setEffect:effect];
					 _effectsDictionary[@(effect.effectID)] = typeEffect;
				 }];
}

- (void) loadMasteries {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	NSMutableArray* masteries = [NSMutableArray new];
	for (int i = 0; i <= 4; i++)
		[masteries addObject:[NSMutableArray new]];
	__block BOOL empty = YES;
	[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM certMasteries WHERE typeID=%d;", self.typeID]
				 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
					 EVEDBCertMastery* mastery = [[EVEDBCertMastery alloc] initWithStatement:stmt];
					 if (mastery.masteryLevel >= 0 && mastery.masteryLevel <= 4) {
						 [masteries[mastery.masteryLevel] addObject:mastery];
						 empty = NO;
					 }
				 }];
	for (NSMutableArray* array in masteries)
		[array sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"certificate.name" ascending:YES]]];
	
	_masteries = empty ? (NSArray*) [NSNull null] : masteries;
}

@end

@implementation EVEDBInvTypeRequiredSkill

- (BOOL) isEqual:(id)object {
	return [object isKindOfClass:[self class]] && self.hash == [object hash];
}

- (NSUInteger) hash {
	NSNumber* hash = objc_getAssociatedObject(self, @"hash");
	if (!hash) {
		int32_t data[] = {self.typeID, self.requiredLevel};
		NSUInteger hash = [[NSData dataWithBytes:data length:sizeof(data)] hash];
		objc_setAssociatedObject(self, @"hash", @(hash), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		return hash;
	}
	else
		return [hash unsignedIntegerValue];
}

- (float) requiredSkillPoints {
	if (_requiredSkillPoints == 0.0 && self.requiredLevel > 0)
		_requiredSkillPoints = [self skillPointsAtLevel:self.requiredLevel];
	return _requiredSkillPoints;
}

- (void) setRequiredLevel:(int32_t)value {
	objc_setAssociatedObject(self, @"hash", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	if (_requiredLevel != value)
		_requiredSkillPoints = 0.0;
	_requiredLevel = value;
}

@end