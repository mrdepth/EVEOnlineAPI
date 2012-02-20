//
//  EVEDBInvControlTowerResourcePurpose.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvControlTowerResourcePurpose.h"
#import "EVEDBDatabase.h"

@interface EVEDBInvControlTowerResourcePurpose(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBInvControlTowerResourcePurpose(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.purposeID = [[dictionary valueForKey:@"purpose"] integerValue];
	self.purposeText = [dictionary valueForKey:@"purposeText"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBInvControlTowerResourcePurpose
@synthesize purposeID;
@synthesize purposeText;

+ (id) invControlTowerResourcePurposeWithPurposeID: (NSInteger)aPurposeID error:(NSError **)errorPtr {
	return [[[EVEDBInvControlTowerResourcePurpose alloc] initWithPurposeID:aPurposeID error:errorPtr] autorelease];
}

+ (id) invControlTowerResourcePurposeWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvControlTowerResourcePurpose alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithPurposeID: (NSInteger)aPurposeID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invControlTowerResourcePurposes WHERE purpose=%d;", aPurposeID]
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
	[purposeText release];
	[super dealloc];
}

@end