//
//  EVEDBIndustryActivityRace.m
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBIndustryActivityRace.h"

@implementation EVEDBIndustryActivityRace

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"productTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"productTypeID"},
		  @"raceID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"raceID"}
		  };
	return map;
}

@end
