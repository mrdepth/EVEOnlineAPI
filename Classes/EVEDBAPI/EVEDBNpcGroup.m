//
//  EVEDBNpcGroup.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 27.01.14.
//
//

#import "EVEDBNpcGroup.h"
#import "EVEDBDatabase.h"
#import "EVEDBEveIcon.h"

@implementation EVEDBNpcGroup

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"npcGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"npcGroupID"},
				@"parentNpcGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentNpcGroupID"},
				@"groupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"groupID"},
				@"iconName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"iconName"},
				@"npcGroupName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"npcGroupName"}
				};
	
	return map;
}

@end