//
//  EVEDBStaStation.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBStaStation.h"
#import "EVEDBDatabase.h"
#import "EVEDBMapRegion.h"
#import "EVEDBMapConstellation.h"
#import "EVEDBMapSolarSystem.h"

@interface EVEDBStaStation(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBStaStation(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.stationID = [[dictionary valueForKey:@"stationID"] integerValue];
	self.security = [[dictionary valueForKey:@"security"] integerValue];
	self.dockingCostPerVolume = [[dictionary valueForKey:@"dockingCostPerVolume"] floatValue];
	self.maxShipVolumeDockable = [[dictionary valueForKey:@"maxShipVolumeDockable"] floatValue];
	self.officeRentalCost = [[dictionary valueForKey:@"officeRentalCost"] integerValue];
	self.operationID = [[dictionary valueForKey:@"operationID"] integerValue];
	self.stationTypeID = [[dictionary valueForKey:@"stationTypeID"] integerValue];
	self.corporationID = [[dictionary valueForKey:@"corporationID"] integerValue];
	self.solarSystemID = [[dictionary valueForKey:@"solarSystemID"] integerValue];
	self.constellationID = [[dictionary valueForKey:@"constellationID"] integerValue];
	self.regionID = [[dictionary valueForKey:@"regionID"] integerValue];
	self.stationName = [dictionary valueForKey:@"stationName"];
	self.reprocessingEfficiency = [[dictionary valueForKey:@"reprocessingEfficiency"] floatValue];
	self.reprocessingStationsTake = [[dictionary valueForKey:@"reprocessingStationsTake"] floatValue];
	self.reprocessingHangarFlag = [[dictionary valueForKey:@"reprocessingHangarFlag"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBStaStation
@synthesize stationID;
@synthesize security;
@synthesize dockingCostPerVolume;
@synthesize maxShipVolumeDockable;
@synthesize officeRentalCost;
@synthesize operationID;
@synthesize stationTypeID;
@synthesize corporationID;
@synthesize solarSystemID;
@synthesize solarSystem;
@synthesize constellationID;
@synthesize constellation;
@synthesize regionID;
@synthesize region;
@synthesize stationName;
@synthesize reprocessingEfficiency;
@synthesize reprocessingStationsTake;
@synthesize reprocessingHangarFlag;

+ (id) staStationWithStationID: (NSInteger)aStationID error:(NSError **)errorPtr {
	return [[[EVEDBStaStation alloc] initWithStationID:aStationID error:errorPtr] autorelease];
}

+ (id) staStationWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBStaStation alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithStationID: (NSInteger)aStationID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from staStations WHERE stationID=%d;", aStationID]
											   target:self
											   action:@selector(didReceiveRecord:)];
		if (error) {
			if (errorPtr)
				*errorPtr = error;
			[self release];
			return nil;
		}
	}
	return self;
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (EVEDBMapRegion*) region {
	if (regionID == 0)
		return NULL;
	if (!region) {
		region = [[EVEDBMapRegion mapRegionWithRegionID:regionID error:nil] retain];
		if (!region)
			region = (EVEDBMapRegion*) [[NSNull null] retain];
	}
	if ((NSNull*) region == [NSNull null])
		return NULL;
	else
		return region;
}

- (EVEDBMapConstellation*) constellation {
	if (constellationID == 0)
		return NULL;
	if (!constellation) {
		constellation = [[EVEDBMapConstellation mapConstellationWithConstellationID:constellationID error:nil] retain];
		if (!constellation)
			constellation = (EVEDBMapConstellation*) [[NSNull null] retain];
	}
	if ((NSNull*) constellation == [NSNull null])
		return NULL;
	else
		return constellation;
}

- (EVEDBMapSolarSystem*) solarSystem {
	if (solarSystemID == 0)
		return NULL;
	if (!solarSystem) {
		solarSystem = [[EVEDBMapSolarSystem mapSolarSystemWithSolarSystemID:solarSystemID error:nil] retain];
		if (!solarSystem)
			solarSystem = (EVEDBMapSolarSystem*) [[NSNull null] retain];
	}
	if ((NSNull*) solarSystem == [NSNull null])
		return NULL;
	else
		return solarSystem;
}

- (void) dealloc {
	[solarSystem release];
	[constellation release];
	[region release];
	[stationName release];
	[super dealloc];
}

@end
