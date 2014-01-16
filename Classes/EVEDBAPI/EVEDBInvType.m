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
- (void) loadAttributes;
- (void) loadEffects;
- (void) loadCertificateRecommendations;
@end




@implementation EVEDBInvType

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
		  @"imageName" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"imageName"}
		  };
	return map;
}

+ (id) invTypeWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr {
	return [[self alloc] initWithTypeID:aTypeID error:errorPtr];
}

+ (id) invTypeWithInvType:(EVEDBInvType*) type {
	return [[self alloc] initWithInvType:type];
}

- (id) initWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr {
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
		self.certificateRecommendations = type->_certificateRecommendations;
	}
	return self;
}

- (EVEDBInvGroup*) group {
	if (self.groupID == 0)
		return NULL;
	if (!_group) {
		_group = [EVEDBInvGroup invGroupWithGroupID:self.groupID error:nil];
		if (!_group)
			_group = (EVEDBInvGroup*) [NSNull null];
	}
	if ((NSNull*) _group == [NSNull null])
		return NULL;
	else
		return _group;
}

- (EVEDBInvMarketGroup*) marketGroup {
	if (self.marketGroupID == 0)
		return NULL;
	if (!_marketGroup) {
		_marketGroup = [EVEDBInvMarketGroup invMarketGroupWithMarketGroupID:self.marketGroupID error:nil];
		if (!_marketGroup)
			_marketGroup = (EVEDBInvMarketGroup*) [NSNull null];
	}
	if ((NSNull*) _marketGroup == [NSNull null])
		return NULL;
	else
		return _marketGroup;
}

- (EVEDBEveIcon*) icon {
	if (self.iconID == 0)
		return NULL;
	if (!_icon) {
		_icon = [EVEDBEveIcon eveIconWithIconID:self.iconID error:nil];
		if (!_icon)
			_icon = (EVEDBEveIcon*) [NSNull null];
	}
	if ((NSNull*) _icon == [NSNull null])
		return NULL;
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

- (NSMutableArray*) certificateRecommendations {
	if (!_certificateRecommendations) {
		[self loadCertificateRecommendations];
	}
	return _certificateRecommendations;
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
	return [object isKindOfClass:[self class]] && self.typeID == [object typeID];
}

- (NSUInteger) hash {
	return self.typeID;
}

- (NSMutableArray*) requiredSkills {
	if (!_requiredSkills) {
		_requiredSkills = [[NSMutableArray alloc] init];
		NSInteger requirementIDs[] = {182, 183, 184, 1285, 1289, 1290};
		NSInteger skillLevelIDs[] = {277, 278, 279, 1286, 1287, 1288};
		for (int i = 0; i < 5; i++) {
			EVEDBDgmTypeAttribute* attributeTypeID = self.attributesDictionary[@(requirementIDs[i])];
			if (attributeTypeID) {
				EVEDBDgmTypeAttribute* attributeLevel = self.attributesDictionary[@(skillLevelIDs[i])];
				EVEDBInvTypeRequiredSkill* skill = [EVEDBInvTypeRequiredSkill invTypeWithTypeID:(NSInteger) attributeTypeID.value error:nil];
				if (skill) {
					skill.requiredLevel = attributeLevel.value;
					[_requiredSkills addObject:skill];
				}
			}
		}
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
		return NULL;
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
		return NULL;
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

- (void) loadCertificateRecommendations {
	EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
	if (!database)
		return;
	_certificateRecommendations = [[NSMutableArray alloc] init];
	
	[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM crtRecommendations WHERE shipTypeID=%d;", self.typeID]
				 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
					 EVEDBCrtRecommendation* recommendation = [[EVEDBCrtRecommendation alloc] initWithStatement:stmt];
					 [_certificateRecommendations addObject:recommendation];
				 }];
}

@end

@implementation EVEDBInvTypeRequiredSkill

- (BOOL) isEqual:(id)object {
	return [object isKindOfClass:[self class]] && self.typeID == [object typeID] && self.requiredLevel == [object requiredLevel];
}

- (float) requiredSkillPoints {
	if (_requiredSkillPoints == 0.0 && self.requiredLevel > 0)
		_requiredSkillPoints = [self skillPointsAtLevel:self.requiredLevel];
	return _requiredSkillPoints;
}

- (void) setRequiredLevel:(NSInteger)value {
	if (_requiredLevel != value)
		_requiredSkillPoints = 0.0;
	_requiredLevel = value;
}

@end