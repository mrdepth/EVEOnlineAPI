//
//  EVEDBMapRegion.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapRegion.h"


@implementation EVEDBMapRegion

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"regionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"regionID"},
		  @"regionName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"regionName"},
		  @"factionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"factionID"},
		  @"radius" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"radius"}
		  };
	return map;
}

+ (id) mapRegionWithRegionID: (int32_t)regionID error:(NSError **)errorPtr {
	return [[EVEDBMapRegion alloc] initWithRegionID:regionID error:errorPtr];
}

- (id) initWithRegionID: (int32_t)regionID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapRegions WHERE regionID=%d;", regionID]
								   error:errorPtr]) {
	}
	return self;
}

@end
