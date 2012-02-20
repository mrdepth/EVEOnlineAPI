//
//  EVEDBRamActivity.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBRamActivity.h"
#import "EVEDBDatabase.h"

@interface EVEDBRamActivity(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBRamActivity(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.activityID = [[dictionary valueForKey:@"activityID"] integerValue];
	self.activityName = [dictionary valueForKey:@"activityName"];
	self.iconNo = [dictionary valueForKey:@"iconNo"];
	self.description = [dictionary valueForKey:@"description"];
	self.published = [[dictionary valueForKey:@"published"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBRamActivity
@synthesize activityID;
@synthesize activityName;
@synthesize iconNo;
@synthesize description;
@synthesize published;

+ (id) ramActivityWithActivityID: (NSInteger)aActivityID error:(NSError **)errorPtr {
	return [[[EVEDBRamActivity alloc] initWithActivityID:aActivityID error:errorPtr] autorelease];
}

+ (id) ramActivityWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBRamActivity alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithActivityID: (NSInteger)aActivityID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from ramActivities WHERE activityID=%d;", aActivityID]
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
	[activityName release];
	[iconNo release];
	[description release];
	[super dealloc];
}

- (NSString*) iconImageName {
	return [NSString stringWithFormat:@"Icons/icon%@.png", iconNo];
}

@end