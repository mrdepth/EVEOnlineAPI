//
//  EVEDBMapDenormalize.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapDenormalize.h"
#import "EVEDBMapRegion.h"
#import "EVEDBMapConstellation.h"
#import "EVEDBMapSolarSystem.h"

@implementation EVEDBMapDenormalize

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"itemID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"itemID"},
		  @"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"groupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"groupID"},
		  @"solarSystemID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"solarSystemID"},
		  @"constellationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"constellationID"},
		  @"regionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"regionID"},
		  @"orbitID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"orbitID"},
		  @"x" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"x"},
		  @"y" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"y"},
		  @"z" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"z"},
		  @"radius" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"radius"},
		  @"itemName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"itemName"},
		  @"security" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"security"},
		  @"celestialIndex" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"celestialIndex"},
		  @"orbitIndex" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"orbitIndex"}
		  };
	return map;
}

+ (id) mapDenormalizeWithItemID: (NSInteger) itemID error:(NSError **)errorPtr {
	return [[EVEDBMapDenormalize alloc] initWithItemID:itemID error:errorPtr];
}

- (id) initWithItemID: (NSInteger) itemID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapDenormalize WHERE itemID=%d;", itemID]
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

- (EVEDBMapConstellation*) constellation {
	if (self.constellationID == 0)
		return nil;
	if (!_constellation) {
		_constellation = [EVEDBMapConstellation mapConstellationWithConstellationID:self.constellationID error:nil];
		if (!_constellation)
			_constellation = (EVEDBMapConstellation*) [NSNull null];
	}
	if ((NSNull*) _constellation == [NSNull null])
		return nil;
	else
		return _constellation;
}

- (EVEDBMapSolarSystem*) solarSystem {
	if (self.solarSystemID == 0)
		return nil;
	if (!_solarSystem) {
		_solarSystem = [EVEDBMapSolarSystem mapSolarSystemWithSolarSystemID:self.solarSystemID error:nil];
		if (!_solarSystem)
			_solarSystem = (EVEDBMapSolarSystem*) [NSNull null];
	}
	if ((NSNull*) _solarSystem == [NSNull null])
		return nil;
	else
		return _solarSystem;
}

@end
