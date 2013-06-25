//
//  EVEDBMapSolarSystem.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapSolarSystem.h"
#import "EVEDBMapRegion.h"
#import "EVEDBMapConstellation.h"

@implementation EVEDBMapSolarSystem

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"regionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"regionID"},
		  @"constellationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"constellationID"},
		  @"solarSystemID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"solarSystemID"},
		  @"solarSystemName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"solarSystemName"},
		  @"luminosity" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"luminosity"},
		  @"constellationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"constellationID"},
		  @"border" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"border"},
		  @"fringe" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"fringe"},
		  @"corridor" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"corridor"},
		  @"hub" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"hub"},
		  @"international" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"international"},
		  @"regional" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"regional"},
		  @"isConstellation" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"isConstellation"},
		  @"security" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"security"},
		  @"factionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"factionID"},
		  @"radius" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"radius"},
		  @"securityClass" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"securityClass"}
		  };
	return map;
}

+ (id) mapSolarSystemWithSolarSystemID: (NSInteger)solarSystemID error:(NSError **)errorPtr {
	return [[EVEDBMapSolarSystem alloc] initWithSolarSystemID:solarSystemID error:errorPtr];
}

+ (id) mapSolarSystemWithSolarSystemName: (NSString*)solarSystemName error:(NSError **)errorPtr {
	return [[EVEDBMapSolarSystem alloc] initWithSolarSystemName:solarSystemName error:errorPtr];
	
}

- (id) initWithSolarSystemID: (NSInteger)solarSystemID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapSolarSystems WHERE solarSystemID=%d;", solarSystemID]
								   error:errorPtr]) {
	}
	return self;
}

- (id) initWithSolarSystemName: (NSString*)solarSystemName error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapSolarSystems WHERE solarSystemName=\"%@\";", solarSystemName]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBMapRegion*) region {
	if (self.regionID == 0)
		return NULL;
	if (!_region) {
		_region = [EVEDBMapRegion mapRegionWithRegionID:self.regionID error:nil];
		if (!_region)
			_region = (EVEDBMapRegion*) [NSNull null];
	}
	if ((NSNull*) _region == [NSNull null])
		return NULL;
	else
		return _region;
}

- (EVEDBMapConstellation*) constellation {
	if (self.constellationID == 0)
		return NULL;
	if (!_constellation) {
		_constellation = [EVEDBMapConstellation mapConstellationWithConstellationID:self.constellationID error:nil];
		if (!_constellation)
			_constellation = (EVEDBMapConstellation*) [NSNull null];
	}
	if ((NSNull*) _constellation == [NSNull null])
		return NULL;
	else
		return _constellation;
}

@end
