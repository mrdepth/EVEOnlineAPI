//
//  EVEDBInvGroup.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvGroup.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvCategory.h"
#import "EVEDBEveIcon.h"

@interface EVEDBInvGroup(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBInvGroup(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.groupID = [[dictionary valueForKey:@"groupID"] integerValue];
	self.categoryID = [[dictionary valueForKey:@"categoryID"] integerValue];
	self.groupName = [dictionary valueForKey:@"groupName"];
	self.description = [dictionary valueForKey:@"description"];
	self.iconID = [[dictionary valueForKey:@"iconID"] integerValue];
	self.useBasePrice = [[dictionary valueForKey:@"useBasePrice"] integerValue];
	self.allowManufacture = [[dictionary valueForKey:@"allowManufacture"] integerValue];
	self.allowRecycler = [[dictionary valueForKey:@"allowRecycler"] integerValue];
	self.anchored = [[dictionary valueForKey:@"anchored"] integerValue];
	self.anchorable = [[dictionary valueForKey:@"anchorable"] integerValue];
	self.fittableNonSingleton = [[dictionary valueForKey:@"fittableNonSingleton"] integerValue];
	self.published = [[dictionary valueForKey:@"published"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBInvGroup
@synthesize groupID;
@synthesize categoryID;
@synthesize category;
@synthesize groupName;
@synthesize description;
@synthesize iconID;
@synthesize icon;
@synthesize useBasePrice;
@synthesize allowManufacture;
@synthesize allowRecycler;
@synthesize anchored;
@synthesize anchorable;
@synthesize fittableNonSingleton;
@synthesize published;

+ (id) invGroupWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr {
	return [[[EVEDBInvGroup alloc] initWithGroupID:aGroupID error:errorPtr] autorelease];
}

+ (id) invGroupWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBInvGroup alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database) {
			[self release];
			return nil;
		}
		NSError *error = [database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invGroups WHERE groupID=%d;", aGroupID]
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

- (EVEDBInvCategory*) category {
	if (categoryID == 0)
		return NULL;
	if (!category) {
		category = [[EVEDBInvCategory invCategoryWithCategoryID:categoryID error:nil] retain];
		if (!category)
			category = (EVEDBInvCategory*) [[NSNull null] retain];
	}
	if ((NSNull*) category == [NSNull null])
		return NULL;
	else
		return category;
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
	[category release];
	[groupName release];
	[description release];
	[icon release];
	[super dealloc];
}
@end
