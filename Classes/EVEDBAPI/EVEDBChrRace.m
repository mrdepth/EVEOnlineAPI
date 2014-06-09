//
//  EVEDBChrRace.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 09.06.14.
//
//

#import "EVEDBChrRace.h"

@implementation EVEDBChrRace

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"raceID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"raceID"},
				@"raceName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"raceName"},
				@"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
				@"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
				@"shortDescription" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"shortDescription"}
				};
	return map;
}

@end