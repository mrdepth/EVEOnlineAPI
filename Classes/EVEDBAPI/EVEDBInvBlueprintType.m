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

@interface EVEDBInvBlueprintType(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBInvBlueprintType(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.blueprintTypeID = [[dictionary valueForKey:@"blueprintTypeID"] integerValue];
	self.parentBlueprintTypeID = [[dictionary valueForKey:@"parentBlueprintTypeID"] integerValue];
	self.productTypeID = [[dictionary valueForKey:@"productTypeID"] integerValue];
	self.productionTime = [[dictionary valueForKey:@"productionTime"] integerValue];
	self.techLevel = [[dictionary valueForKey:@"techLevel"] integerValue];
	self.researchProductivityTime = [[dictionary valueForKey:@"researchProductivityTime"] integerValue];
	self.researchMaterialTime = [[dictionary valueForKey:@"researchMaterialTime"] integerValue];
	self.researchCopyTime = [[dictionary valueForKey:@"researchCopyTime"] integerValue];
	self.researchTechTime = [[dictionary valueForKey:@"researchTechTime"] integerValue];
	self.productivityModifier = [[dictionary valueForKey:@"productivityModifier"] integerValue];
	self.materialModifier = [[dictionary valueForKey:@"materialModifier"] integerValue];
	self.wasteFactor = [[dictionary valueForKey:@"wasteFactor"] integerValue];
	self.maxProductionLimit = [[dictionary valueForKey:@"maxProductionLimit"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBInvBlueprintType
@synthesize blueprintTypeID;
@synthesize blueprintType;
@synthesize parentBlueprintTypeID;
@synthesize parentBlueprintType;
@synthesize productTypeID;
@synthesize productType;
@synthesize productionTime;
@synthesize techLevel;
@synthesize researchProductivityTime;
@synthesize researchMaterialTime;
@synthesize researchCopyTime;
@synthesize researchTechTime;
@synthesize productivityModifier;
@synthesize materialModifier;
@synthesize wasteFactor;
@synthesize maxProductionLimit;
@synthesize ramTypeRequirements;
@synthesize typeMaterials;


+ (id) invBlueprintTypeWithBlueprintTypeID: (NSInteger)aBlueprintTypeID error:(NSError **)errorPtr {
	return [[[EVEDBInvBlueprintType alloc] initWithBlueprintTypeID:aBlueprintTypeID error:errorPtr] autorelease];
}

+ (id) invBlueprintTypeWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvBlueprintType alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithBlueprintTypeID: (NSInteger)aBlueprintTypeID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invBlueprintTypes WHERE blueprintTypeID=%d;", aBlueprintTypeID]
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

- (EVEDBInvType*) blueprintType {
	if (blueprintTypeID == 0)
		return NULL;
	if (!blueprintType) {
		blueprintType = [[EVEDBInvType invTypeWithTypeID:blueprintTypeID error:nil] retain];
		if (!blueprintType)
			blueprintType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) blueprintType == [NSNull null])
		return NULL;
	else
		return blueprintType;
}

- (EVEDBInvBlueprintType*) parentBlueprintType {
	if (parentBlueprintTypeID == 0)
		return NULL;
	if (!parentBlueprintType) {
		parentBlueprintType = [[EVEDBInvBlueprintType invBlueprintTypeWithBlueprintTypeID:parentBlueprintTypeID error:nil] retain];
		if (!parentBlueprintType)
			parentBlueprintType = (EVEDBInvBlueprintType*) [[NSNull null] retain];
	}
	if ((NSNull*) parentBlueprintType == [NSNull null])
		return NULL;
	else
		return parentBlueprintType;
}

- (EVEDBInvType*) productType {
	if (productTypeID == 0)
		return NULL;
	if (!productType) {
		productType = [[EVEDBInvType invTypeWithTypeID:productTypeID error:nil] retain];
		if (!productType)
			productType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) productType == [NSNull null])
		return NULL;
	else
		return productType;
}

- (NSDictionary*) ramTypeRequirements {
	if (!ramTypeRequirements) {
		ramTypeRequirements = [[NSMutableDictionary alloc] init];
		
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM ramTypeRequirements where typeID=%d;", blueprintTypeID]
							 resultBlock:^(NSDictionary *record, BOOL *needsMore) {
								 NSString* activityID = [record valueForKey:@"activityID"];
								 NSMutableArray* array = [ramTypeRequirements valueForKey:activityID];
								 EVEDBRamActivity* activity;
								 if (!array) {
									 array = [NSMutableArray array];
									 [ramTypeRequirements setValue:array forKey:activityID];
									 activity = [EVEDBRamActivity ramActivityWithActivityID:[activityID integerValue] error:nil];
								 }
								 else
									 activity = [[array objectAtIndex:0] activity];
								 EVEDBRamTypeRequirement* typeRequirement = [EVEDBRamTypeRequirement ramTypeRequirementWithDictionary:record];
								 typeRequirement.activity = activity;
								 typeRequirement.type = self.blueprintType;
								 [array addObject:typeRequirement];
							 }];
		}
	}
	return ramTypeRequirements;
}

- (NSArray*) typeMaterials {
	if (!typeMaterials) {
		typeMaterials = [[NSMutableArray alloc] init];
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (database) {
			[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invTypeMaterials where typeID=%d order by quantity desc;", productTypeID]
							 resultBlock:^(NSDictionary *record, BOOL *needsMore) {
								 EVEDBInvTypeMaterial* typeMaterial = [EVEDBInvTypeMaterial invTypeMaterialWithDictionary:record];
								 if (typeMaterial) {
									 typeMaterial.type = self.productType;
									 [typeMaterials addObject:typeMaterial];
								 }
							 }];
		}
	}
	return typeMaterials;
}

- (void) dealloc {
	[blueprintType release];
	[parentBlueprintType release];
	[productType release];
	[ramTypeRequirements release];
	[typeMaterials release];
	[super dealloc];
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
	
/*	EVEDBRamActivity* activity;
	if (requirements.count > 0)
		activity = [[requirements objectAtIndex:0] activity];
	else
		activity = [EVEDBRamActivity ramActivityWithActivityID:activityID error:nil];*/
	
	if (activityID == 1) {//Manufacturing
		[requirements addObjectsFromArray:self.typeMaterials];
/*		for (EVEDBInvTypeMaterial* material in self.typeMaterials) {
			EVEDBRamTypeRequirement* requirement = [[EVEDBRamTypeRequirement alloc] init];
			requirement.requiredTypeID = material.materialTypeID;
			requirement.quantity = material.quantity * (1.0 + self.wasteFactor / 100.0);
			requirement.activityID = activityID;
			requirement.activity = activity;
			[requirements addObject:requirement];
		}*/
	}
	return requirements;
}

@end
