//
//  EVEDBMapDenormalize.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapDenormalize.h"
#import "EVEDBDatabase.h"
#import "EVEDBMapRegion.h"
#import "EVEDBMapConstellation.h"
#import "EVEDBMapSolarSystem.h"

@interface EVEDBMapDenormalize(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBMapDenormalize(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.itemID = [[dictionary valueForKey:@"itemID"] integerValue];
	self.typeID = [[dictionary valueForKey:@"typeID"] integerValue];
	self.groupID = [[dictionary valueForKey:@"groupID"] integerValue];
	self.solarSystemID = [[dictionary valueForKey:@"solarSystemID"] integerValue];
	self.constellationID = [[dictionary valueForKey:@"constellationID"] integerValue];
	self.regionID = [[dictionary valueForKey:@"regionID"] integerValue];
	self.orbitID = [[dictionary valueForKey:@"orbitID"] integerValue];
	self.x = [[dictionary valueForKey:@"x"] floatValue];
	self.y = [[dictionary valueForKey:@"y"] floatValue];
	self.z = [[dictionary valueForKey:@"z"] floatValue];
	self.radius = [[dictionary valueForKey:@"radius"] floatValue];
	self.itemName = [dictionary valueForKey:@"itemName"];
	self.security = [[dictionary valueForKey:@"security"] floatValue];
	self.celestialIndex = [[dictionary valueForKey:@"celestialIndex"] integerValue];
	self.orbitIndex = [[dictionary valueForKey:@"orbitIndex"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBMapDenormalize
@synthesize itemID;
@synthesize typeID;
@synthesize groupID;
@synthesize solarSystemID;
@synthesize solarSystem;
@synthesize constellationID;
@synthesize constellation;
@synthesize regionID;
@synthesize region;
@synthesize orbitID;
@synthesize x;
@synthesize y;
@synthesize z;
@synthesize radius;
@synthesize itemName;
@synthesize security;
@synthesize celestialIndex;
@synthesize orbitIndex;

+ (id) mapDenormalizeWithItemID: (NSInteger) aItemID error:(NSError **)errorPtr {
	return [[[EVEDBMapDenormalize alloc] initWithItemID:aItemID error:errorPtr] autorelease];
}

+ (id) mapDenormalizeWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBMapDenormalize alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithItemID: (NSInteger) aItemID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapDenormalize WHERE itemID=%d;", aItemID]
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

- (void) dealloc {
	[itemName release];
	[solarSystem release];
	[constellation release];
	[region release];
	[super dealloc];
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

@end
