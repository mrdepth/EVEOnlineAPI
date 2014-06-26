//
//  EVEDBStaStation.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBStaStation.h"
#import "EVEDBMapRegion.h"
#import "EVEDBMapConstellation.h"
#import "EVEDBMapSolarSystem.h"


@implementation EVEDBStaStation

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"stationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"stationID"},
		  @"security" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"security"},
		  @"dockingCostPerVolume" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"dockingCostPerVolume"},
		  @"maxShipVolumeDockable" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"maxShipVolumeDockable"},
		  @"officeRentalCost" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"officeRentalCost"},
		  @"operationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"operationID"},
		  @"stationTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"stationTypeID"},
		  @"corporationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"corporationID"},
		  @"solarSystemID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"solarSystemID"},
		  @"constellationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"constellationID"},
		  @"regionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"regionID"},
		  @"stationName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"stationName"},
		  @"reprocessingEfficiency" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"reprocessingEfficiency"},
		  @"reprocessingStationsTake" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"reprocessingStationsTake"},
		  @"reprocessingHangarFlag" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"reprocessingHangarFlag"}
		  };
	return map;
}

+ (id) staStationWithStationID: (int32_t)stationID error:(NSError **)errorPtr {
	return [[EVEDBStaStation alloc] initWithStationID:stationID error:errorPtr];
}

- (id) initWithStationID: (int32_t)stationID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from staStations WHERE stationID=%d;", stationID]
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
