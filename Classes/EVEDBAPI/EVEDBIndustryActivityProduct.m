//
//  EVEDBIndustryActivityProduct.m
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBIndustryActivityProduct.h"

@implementation EVEDBIndustryActivityProduct

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"productTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"productTypeID"},
		  @"quantity" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"quantity"}
		  };
	return map;
}

@end
