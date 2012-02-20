//
//  EVEDBMapConstellation.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapConstellation.h"
#import "EVEDBDatabase.h"
#import "EVEDBMapRegion.h"

@interface EVEDBMapConstellation(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBMapConstellation(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.regionID = [[dictionary valueForKey:@"regionID"] integerValue];
	self.constellationID = [[dictionary valueForKey:@"constellationID"] integerValue];
	self.constellationName = [dictionary valueForKey:@"constellationName"];
	self.factionID = [[dictionary valueForKey:@"factionID"] integerValue];
	self.radius = [[dictionary valueForKey:@"radius"] floatValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBMapConstellation
@synthesize regionID;
@synthesize region;
@synthesize constellationID;
@synthesize constellationName;
@synthesize factionID;
@synthesize radius;

+ (id) mapConstellationWithConstellationID: (NSInteger)aConstellationID error:(NSError **)errorPtr {
	return [[[EVEDBMapConstellation alloc] initWithConstellationID:aConstellationID error:errorPtr] autorelease];
}

+ (id) mapConstellationWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBMapConstellation alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithConstellationID: (NSInteger)aConstellationID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapConstellations WHERE constellationID=%d;", aConstellationID]
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

- (void) dealloc {
	[region release];
	[constellationName release];
	[super dealloc];
}

@end
