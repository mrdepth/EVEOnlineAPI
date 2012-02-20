//
//  EVEDBCrtClass.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtClass.h"
#import "EVEDBDatabase.h"

@interface EVEDBCrtClass(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBCrtClass(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.classID = [[dictionary valueForKey:@"classID"] integerValue];
	self.description = [dictionary valueForKey:@"description"];
	self.className = [dictionary valueForKey:@"className"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBCrtClass
@synthesize classID;
@synthesize description;
@synthesize className;

+ (id) crtClassWithClassID: (NSInteger)aClassID error:(NSError **)errorPtr {
	return [[[EVEDBCrtClass alloc] initWithClassID:aClassID error:errorPtr] autorelease];
}

+ (id) crtClassWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBCrtClass alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithClassID: (NSInteger)aClassID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtClasses WHERE classID=%d;", aClassID]
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
	[description release];
	[className release];
	[super dealloc];
}

@end