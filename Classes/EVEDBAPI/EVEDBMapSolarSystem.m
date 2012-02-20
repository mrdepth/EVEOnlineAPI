//
//  EVEDBMapSolarSystem.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapSolarSystem.h"
#import "EVEDBDatabase.h"
#import "EVEDBMapRegion.h"
#import "EVEDBMapConstellation.h"

@interface EVEDBMapSolarSystem(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBMapSolarSystem(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.regionID = [[dictionary valueForKey:@"regionID"] integerValue];
	self.constellationID = [[dictionary valueForKey:@"constellationID"] integerValue];
	self.solarSystemID = [[dictionary valueForKey:@"solarSystemID"] integerValue];
	self.solarSystemName = [dictionary valueForKey:@"solarSystemName"];
	self.luminosity = [[dictionary valueForKey:@"luminosity"] floatValue];
	self.border = [[dictionary valueForKey:@"border"] integerValue];
	self.fringe = [[dictionary valueForKey:@"fringe"] integerValue];
	self.corridor = [[dictionary valueForKey:@"corridor"] integerValue];
	self.hub = [[dictionary valueForKey:@"hub"] integerValue];
	self.international = [[dictionary valueForKey:@"international"] integerValue];
	self.regional = [[dictionary valueForKey:@"regional"] integerValue];
	self.isConstellation = [[dictionary valueForKey:@"constellation"] integerValue];
	self.security = [[dictionary valueForKey:@"security"] floatValue];
	self.factionID = [[dictionary valueForKey:@"factionID"] integerValue];
	self.radius = [[dictionary valueForKey:@"radius"] floatValue];
	self.securityClass = [dictionary valueForKey:@"securityClass"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBMapSolarSystem
@synthesize regionID;
@synthesize region;
@synthesize constellationID;
@synthesize constellation;
@synthesize solarSystemID;
@synthesize solarSystemName;
@synthesize luminosity;
@synthesize border;
@synthesize fringe;
@synthesize corridor;
@synthesize hub;
@synthesize international;
@synthesize regional;
@synthesize isConstellation;
@synthesize security;
@synthesize factionID;
@synthesize radius;
@synthesize securityClass;

+ (id) mapSolarSystemWithSolarSystemID: (NSInteger)aSolarSystemID error:(NSError **)errorPtr {
	return [[[EVEDBMapSolarSystem alloc] initWithSolarSystemID:aSolarSystemID error:errorPtr] autorelease];
}

+ (id) mapSolarSystemWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBMapSolarSystem alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithSolarSystemID: (NSInteger)aSolarSystemID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapSolarSystems WHERE solarSystemID=%d;", aSolarSystemID]
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

- (void) dealloc {
	[region release];
	[constellation release];
	[solarSystemName release];
	[securityClass release];
	[super dealloc];
}

@end
