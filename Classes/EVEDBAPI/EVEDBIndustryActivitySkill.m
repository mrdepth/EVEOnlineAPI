//
//  EVEDBIndustryActivitySkill.m
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBIndustryActivitySkill.h"

@implementation EVEDBIndustryActivitySkill

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"skillID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"skillID"},
		  @"level" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"level"}
		  };
	return map;
}

@end
