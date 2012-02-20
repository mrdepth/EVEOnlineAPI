//
//  EVEDBInvMarketGroup.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvMarketGroup.h"
#import "EVEDBDatabase.h"
#import "EVEDBEveIcon.h"

@interface EVEDBInvMarketGroup(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBInvMarketGroup(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.marketGroupID = [[dictionary valueForKey:@"marketGroupID"] integerValue];
	self.parentGroupID = [[dictionary valueForKey:@"parentGroupID"] integerValue];
	self.marketGroupName = [dictionary valueForKey:@"marketGroupName"];
	self.description = [dictionary valueForKey:@"description"];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.hasTypes = [[dictionary valueForKey:@"hasTypes"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBInvMarketGroup
@synthesize marketGroupID;
@synthesize parentGroupID;
@synthesize parentGroup;
@synthesize marketGroupName;
@synthesize description;
@synthesize iconID;
@synthesize icon;
@synthesize hasTypes;


+ (id) invMarketGroupWithMarketGroupID: (NSInteger)aMarketGroupID error:(NSError **)errorPtr {
	return [[[EVEDBInvMarketGroup alloc] initWithMarketGroupID:aMarketGroupID error:errorPtr] autorelease];
}

+ (id) invMarketGroupWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvMarketGroup alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithMarketGroupID: (NSInteger)aMarketGroupID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invMarketGroups WHERE marketGroupID=%d;", aMarketGroupID]
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

- (EVEDBInvMarketGroup*) parentGroup {
	if (parentGroupID == 0)
		return NULL;
	if (!parentGroup) {
		parentGroup = [[EVEDBInvMarketGroup invMarketGroupWithMarketGroupID:parentGroupID error:nil] retain];
		if (!parentGroup)
			parentGroup = (EVEDBInvMarketGroup*) [[NSNull null] retain];
	}
	if ((NSNull*) parentGroup == [NSNull null])
		return NULL;
	else
		return parentGroup;
}

- (EVEDBEveIcon*) icon {
	if (iconID == 0)
		return NULL;
	if (!icon) {
		icon = [[EVEDBEveIcon eveIconWithIconID:iconID error:nil] retain];
		if (!icon)
			icon = (EVEDBEveIcon*) [[NSNull null] retain];
	}
	if ((NSNull*) icon == [NSNull null])
		return NULL;
	else
		return icon;
}


- (void) dealloc {
	[parentGroup release];
	[marketGroupName release];
	[description release];
	[icon release];
	[super dealloc];
}

@end
