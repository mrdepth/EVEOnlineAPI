//
//  EVEDBDgmEffect.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmEffect.h"


@implementation EVEDBDgmEffect
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"effectID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"effectID"},
		  @"effectName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"effectName"},
		  @"effectCategory" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"effectCategory"},
		  @"preExpression" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"preExpression"},
		  @"postExpression" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"postExpression"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"guid" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"guid"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"isOffensive" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"isOffensive"},
		  @"isAssistance" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"isAssistance"},
		  @"durationAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"durationAttributeID"},
		  @"trackingSpeedAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"trackingSpeedAttributeID"},
		  @"dischargeAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"dischargeAttributeID"},
		  @"rangeAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"rangeAttributeID"},
		  @"falloffAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"falloffAttributeID"},
		  @"disallowAutoRepeat" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"disallowAutoRepeat"},
		  @"published" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"published"},
		  @"displayName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"displayName"},
		  @"isWarpSafe" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"isWarpSafe"},
		  @"rangeChance" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"rangeChance"},
		  @"electronicChance" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"electronicChance"},
		  @"propulsionChance" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"propulsionChance"},
		  @"distribution" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"distribution"},
		  @"sfxName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"sfxName"},
		  @"npcUsageChanceAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"npcUsageChanceAttributeID"},
		  @"npcActivationChanceAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"npcActivationChanceAttributeID"},
		  @"fittingUsageChanceAttributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"fittingUsageChanceAttributeID"}
		  };
	return map;
}

+ (id) dgmEffectWithEffectID: (int32_t)effectID error:(NSError **)errorPtr {
	return [[EVEDBDgmEffect alloc] initWithEffectID:effectID error:errorPtr];
}

- (id) initWithEffectID: (int32_t)effectID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from dgmEffects WHERE effectID=%d;", effectID]
								   error:errorPtr]) {
	}
	return self;
}

@end
