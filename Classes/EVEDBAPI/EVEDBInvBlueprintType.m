//
//  EVEDBInvBlueprintType.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBInvBlueprintType.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvType.h"
#import "EVEDBInvGroup.h"
#import "EVEDBRamTypeRequirement.h"
#import "EVEDBRamActivity.h"
#import "EVEDBInvTypeMaterial.h"

@implementation EVEDBInvBlueprintType

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"blueprintTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"blueprintTypeID"},
		  @"parentBlueprintTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentBlueprintTypeID"},
		  @"productTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"productTypeID"},
		  @"productionTime" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"productionTime"},
		  @"techLevel" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"techLevel"},
		  @"researchProductivityTime" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"researchProductivityTime"},
		  @"researchMaterialTime" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"researchMaterialTime"},
		  @"researchCopyTime" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"researchCopyTime"},
		  @"researchTechTime" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"researchTechTime"},
		  @"productivityModifier" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"productivityModifier"},
		  @"materialModifier" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"materialModifier"},
		  @"wasteFactor" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"wasteFactor"},
		  @"maxProductionLimit" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"maxProductionLimit"}
		  };
	return map;
}

+ (id) invBlueprintTypeWithBlueprintTypeID: (NSInteger)aBlueprintTypeID error:(NSError **)errorPtr {
	return [[EVEDBInvBlueprintType alloc] initWithBlueprintTypeID:aBlueprintTypeID error:errorPtr];
}

- (id) initWithBlueprintTypeID: (NSInteger)aBlueprintTypeID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invBlueprintTypes WHERE blueprintTypeID=%d;", aBlueprintTypeID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBInvType*) blueprintType {
	if (_blueprintTypeID == 0)
		return NULL;
	if (!_blueprintType) {
		_blueprintType = [EVEDBInvType invTypeWithTypeID:_blueprintTypeID error:nil];
		if (!_blueprintType)
			_blueprintType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _blueprintType == [NSNull null])
		return NULL;
	else
		return _blueprintType;
}

- (EVEDBInvBlueprintType*) parentBlueprintType {
	if (_parentBlueprintTypeID == 0)
		return NULL;
	if (!_parentBlueprintType) {
		_parentBlueprintType = [EVEDBInvBlueprintType invBlueprintTypeWithBlueprintTypeID:_parentBlueprintTypeID error:nil];
		if (!_parentBlueprintType)
			_parentBlueprintType = (EVEDBInvBlueprintType*) [NSNull null];
	}
	if ((NSNull*) _parentBlueprintType == [NSNull null])
		return NULL;
	else
		return _parentBlueprintType;
}

- (EVEDBInvType*) productType {
	if (_productTypeID == 0)
		return NULL;
	if (!_productType) {
		_productType = [EVEDBInvType invTypeWithTypeID:_productTypeID error:nil];
		if (!_productType)
			_productType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _productType == [NSNull null])
		return NULL;
	else
		return _productType;
}

- (NSDictionary*) ramTypeRequirements {
	if (!_ramTypeRequirements) {
		_ramTypeRequirements = [[NSMutableDictionary alloc] init];
		
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM ramTypeRequirements where typeID=%d;", self.blueprintTypeID]
						 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
							 EVEDBRamTypeRequirement* typeRequirement = [[EVEDBRamTypeRequirement alloc] initWithStatement:stmt];
							 NSValue* key = @(typeRequirement.activityID);
							 NSMutableArray* array = [_ramTypeRequirements objectForKey:key];
							 EVEDBRamActivity* activity;
							 if (!array) {
								 array = [NSMutableArray array];
								 [_ramTypeRequirements setObject:array forKey:key];
								 activity = [EVEDBRamActivity ramActivityWithActivityID:typeRequirement.activityID error:nil];
							 }
							 else
								 activity = [[array objectAtIndex:0] activity];
							 
							 typeRequirement.activity = activity;
							 typeRequirement.type = self.blueprintType;
							 [array addObject:typeRequirement];
						 }];
		}
	}
	return _ramTypeRequirements;
}

- (NSArray*) typeMaterials {
	if (!_typeMaterials) {
		_typeMaterials = [[NSMutableArray alloc] init];
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invTypeMaterials where typeID=%d order by quantity desc;", self.productTypeID]
						 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
								 EVEDBInvTypeMaterial* typeMaterial = [[EVEDBInvTypeMaterial alloc] initWithStatement:stmt];
								 if (typeMaterial) {
									 typeMaterial.type = self.productType;
									 [(NSMutableArray*) _typeMaterials addObject:typeMaterial];
								 }
						 }];
		}
	}
	return _typeMaterials;
}

- (NSArray*) activities {
	NSMutableArray* activities = [NSMutableArray array];
	for (NSString* key in [self.ramTypeRequirements allKeys]) {
		NSArray* requirements = [self.ramTypeRequirements valueForKey:key];
		EVEDBRamActivity* activity = nil;
		if (requirements.count > 0)
			activity = [[requirements objectAtIndex:0] activity];
		else
			activity = [EVEDBRamActivity ramActivityWithActivityID:[key integerValue] error:nil];
		[activities addObject:activity];
	}
	if (activities.count == 0 && self.typeMaterials.count > 0)
		[activities addObject:[EVEDBRamActivity ramActivityWithActivityID:1 error:nil]];
	return activities;
}

- (NSArray*) requiredSkillsForActivity:(NSInteger) activityID {
	NSMutableArray* skills = [NSMutableArray array];
	NSArray* requirements = [self.ramTypeRequirements valueForKey:[NSString stringWithFormat:@"%d", activityID]];
	for (EVEDBRamTypeRequirement* requirement in requirements) {
		if (requirement.requiredType.group.categoryID == 16) { //Skill
			EVEDBInvTypeRequiredSkill* skill = [EVEDBInvTypeRequiredSkill invTypeWithTypeID:requirement.requiredTypeID error:nil];
			if (skill) {
				skill.requiredLevel = requirement.quantity;
				[skills addObject:skill];
			}
		}
	}
	return skills;
}

- (NSArray*) requiredMaterialsForActivity:(NSInteger) activityID {
	NSMutableArray* requirements = [NSMutableArray array];

	for (EVEDBRamTypeRequirement* requirement in [self.ramTypeRequirements valueForKey:[NSString stringWithFormat:@"%d", activityID]]) {
		if (requirement.requiredType.group.categoryID != 16) //Skill
			[requirements addObject:requirement];
	}
	
	if (activityID == 1) {//Manufacturing
		[requirements addObjectsFromArray:self.typeMaterials];
	}
	return requirements;
}

@end
