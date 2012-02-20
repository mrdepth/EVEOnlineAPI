//
//  EVEDBMapRegion.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBMapRegion.h"
#import "EVEDBDatabase.h"

@interface EVEDBMapRegion(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBMapRegion(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.regionID = [[dictionary valueForKey:@"regionID"] integerValue];
	self.regionName = [dictionary valueForKey:@"regionName"];
	self.factionID = [[dictionary valueForKey:@"factionID"] integerValue];
	self.radius = [[dictionary valueForKey:@"radius"] floatValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBMapRegion
@synthesize regionID;
@synthesize regionName;
@synthesize factionID;
@synthesize radius;

+ (id) mapRegionWithRegionID: (NSInteger)aRegionID error:(NSError **)errorPtr {
	return [[[EVEDBMapRegion alloc] initWithRegionID:aRegionID error:errorPtr] autorelease];
}

+ (id) mapRegionWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBMapRegion alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithRegionID: (NSInteger)aRegionID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from mapRegions WHERE regionID=%d;", aRegionID]
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
	[regionName release];
	[super dealloc];
}

@end
