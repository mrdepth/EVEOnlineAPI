//
//  EVEDBRamAssemblyLineType.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBRamAssemblyLineType.h"
#import "EVEDBDatabase.h"
#import "EVEDBRamActivity.h"

@interface EVEDBRamAssemblyLineType(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBRamAssemblyLineType(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.assemblyLineTypeID = [[dictionary valueForKey:@"assemblyLineTypeID"] integerValue];
	self.assemblyLineTypeName = [dictionary valueForKey:@"assemblyLineTypeName"];
	self.description = [dictionary valueForKey:@"description"];
	self.baseTimeMultiplier = [[dictionary valueForKey:@"baseTimeMultiplier"] floatValue];
	self.baseMaterialMultiplier = [[dictionary valueForKey:@"baseMaterialMultiplier"] floatValue];
	self.volume = [[dictionary valueForKey:@"volume"] floatValue];
	self.activityID = [[dictionary valueForKey:@"activityID"] integerValue];
	self.minCostPerHour = [[dictionary valueForKey:@"minCostPerHour"] floatValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBRamAssemblyLineType
@synthesize assemblyLineTypeID;
@synthesize assemblyLineTypeName;
@synthesize description;
@synthesize baseTimeMultiplier;
@synthesize baseMaterialMultiplier;
@synthesize volume;
@synthesize activityID;
@synthesize activity;
@synthesize minCostPerHour;

+ (id) ramAssemblyLineTypeWithAssemblyLineTypeID: (NSInteger)aAssemblyLineTypeID error:(NSError **)errorPtr {
	return [[[EVEDBRamAssemblyLineType alloc] initWithAssemblyLineTypeID:aAssemblyLineTypeID error:errorPtr] autorelease];
}

+ (id) ramAssemblyLineTypeWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBRamAssemblyLineType alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithAssemblyLineTypeID: (NSInteger)aAssemblyLineTypeID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from ramAssemblyLineTypes WHERE assemblyLineTypeID=%d;", aAssemblyLineTypeID]
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
	[assemblyLineTypeName release];
	[description release];
	[activity release];
	[super dealloc];
}

- (EVEDBRamActivity*) activity {
	if (activityID == 0)
		return NULL;
	if (!activity) {
		activity = [[EVEDBRamActivity ramActivityWithActivityID:activityID error:nil] retain];
		if (!activity)
			activity = (EVEDBRamActivity*) [[NSNull null] retain];
	}
	if ((NSNull*) activity == [NSNull null])
		return NULL;
	else
		return activity;
}

@end