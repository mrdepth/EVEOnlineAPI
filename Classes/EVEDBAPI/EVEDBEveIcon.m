//
//  EVEDBEveIcon.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBEveIcon.h"
#import "EVEDBDatabase.h"

@interface EVEDBEveIcon(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBEveIcon(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.iconFile = [dictionary valueForKey:@"iconFile"];
	self.description = [dictionary valueForKey:@"description"];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBEveIcon
@synthesize iconID;
@synthesize iconFile;
@synthesize description;

+ (id) eveIconWithIconID: (NSInteger)aIconID error:(NSError **)errorPtr {
	return [[[EVEDBEveIcon alloc] initWithIconID:aIconID error:errorPtr] autorelease];
}

+ (id) eveIconWithWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBEveIcon alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithIconID: (NSInteger)aIconID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from eveIcons WHERE iconID=%d;", aIconID]
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

- (NSString*) iconImageName {
	if (!iconImageName) {
		if (!iconFile)
			iconImageName = (NSString*) [[NSNull null] retain];
		else {
			iconImageName = [[NSString stringWithFormat:@"Icons/icon%@.png", iconFile] retain];
		}
	}
	if ((NSNull*) iconImageName == [NSNull null])
		return NULL;
	else
		return iconImageName;
}

- (void) dealloc {
	[iconFile release];
	[description release];
	[iconImageName release];
	[super dealloc];
}

@end
