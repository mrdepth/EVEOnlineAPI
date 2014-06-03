//
//  EVEDBInvMetaType.m
//  Neocom
//
//  Created by Артем Шиманский on 13.05.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "EVEDBInvMetaType.h"

@implementation EVEDBInvMetaType

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
				@"parentTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentTypeID"},
				@"metaGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"metaGroupID"}
				};
	return map;
}

@end
