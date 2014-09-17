//
//  EVEDBIndustryActivityMaterial.m
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBIndustryActivityMaterial.h"

@implementation EVEDBIndustryActivityMaterial

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"materialTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"materialTypeID"},
		  @"quantity" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"quantity"},
		  @"consume" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"consume"}
		  };
	return map;
}

@end
