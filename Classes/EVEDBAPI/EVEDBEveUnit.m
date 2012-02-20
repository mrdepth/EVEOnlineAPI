//
//  EVEDBEveUnit.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBEveUnit.h"
#import "EVEDBDatabase.h"

@interface EVEDBEveUnit(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBEveUnit(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.unitID = [[dictionary valueForKey:@"unitID"] integerValue];
	self.unitName = [dictionary valueForKey:@"unitName"];
	self.displayName = [dictionary valueForKey:@"displayName"];
	self.description = [dictionary valueForKey:@"description"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBEveUnit
@synthesize unitID;
@synthesize unitName;
@synthesize displayName;
@synthesize description;

+ (id) eveUnitWithUnitID: (NSInteger)aUnitID error:(NSError **)errorPtr {
	return [[[EVEDBEveUnit alloc] initWithUnitID:aUnitID error:errorPtr] autorelease];
}

+ (id) eveUnitWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBEveUnit alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithUnitID: (NSInteger)aUnitID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from eveUnits WHERE unitID=%d;", aUnitID]
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
	[unitName release];
	[displayName release];
	[description release];
	[super dealloc];
}

@end
