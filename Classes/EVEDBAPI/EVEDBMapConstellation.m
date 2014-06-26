//
//  EVEDBMapConstellation.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapConstellation.h"
#import "EVEDBMapRegion.h"


@implementation EVEDBMapConstellation

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"regionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"regionID"},
		  @"constellationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"constellationID"},
		  @"constellationName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"constellationName"},
		  @"factionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"factionID"},
		  @"radius" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"radius"}
		  };
	return map;
}

+ (id) mapConstellationWithConstellationID: (int32_t)constellationID error:(NSError **)errorPtr {
	return [[EVEDBMapConstellation alloc] initWithConstellationID:constellationID error:errorPtr];
}

- (id) initWithConstellationID: (int32_t)constellationID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapConstellations WHERE constellationID=%d;", constellationID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBMapRegion*) region {
	if (self.regionID == 0)
		return nil;
	if (!_region) {
		_region = [EVEDBMapRegion mapRegionWithRegionID:self.regionID error:nil];
		if (!_region)
			_region = (EVEDBMapRegion*) [NSNull null];
	}
	if ((NSNull*) _region == [NSNull null])
		return nil;
	else
		return _region;
}

@end
