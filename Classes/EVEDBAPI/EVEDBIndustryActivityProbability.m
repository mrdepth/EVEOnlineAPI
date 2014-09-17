//
//  EVEDBIndustryActivityProbability.m
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBIndustryActivityProbability.h"

@implementation EVEDBIndustryActivityProbability

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"productTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"productTypeID"},
		  @"probability" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"probability"}
		  };
	return map;
}

@end
