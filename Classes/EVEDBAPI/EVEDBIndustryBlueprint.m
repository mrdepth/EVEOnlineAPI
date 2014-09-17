//
//  EVEDBIndustryBlueprint.m
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBIndustryBlueprint.h"

@implementation EVEDBIndustryBlueprint
+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"maxProductionLimit" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"maxProductionLimit"}
		  };
	return map;
}
@end
