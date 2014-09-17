//
//  EVEDBIndustryActivity.m
//  NCDatabase
//
//  Created by Артем Шиманский on 16.09.14.
//
//

#import "EVEDBIndustryActivity.h"

@implementation EVEDBIndustryActivity

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"time" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"time"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"}
		  };
	return map;
}

@end
