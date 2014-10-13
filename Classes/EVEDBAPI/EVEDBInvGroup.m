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
	self.groupID = [[dictionary valueForKey:@"groupID"] intValue];
	self.categoryID = [[dictionary valueForKey:@"categoryID"] intValue];
	self.groupName = [dictionary valueForKey:@"groupName"];
	self.description = [dictionary valueForKey:@"description"];
	self.iconID = [[dictionary valueForKey:@"iconID"] intValue];
	self.useBasePrice = [[dictionary valueForKey:@"useBasePrice"] intValue];
	self.allowManufacture = [[dictionary valueForKey:@"allowManufacture"] intValue];
	self.allowRecycler = [[dictionary valueForKey:@"allowRecycler"] intValue];
	self.anchored = [[dictionary valueForKey:@"anchored"] intValue];
	self.anchorable = [[dictionary valueForKey:@"anchorable"] intValue];
	self.fittableNonSingleton = [[dictionary valueForKey:@"fittableNonSingleton"] intValue];
	self.published = [[dictionary valueForKey:@"published"] intValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end


@implementation EVEDBInvGroup
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"groupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"groupID"},
		  @"categoryID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"categoryID"},
		  @"groupName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"groupName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"useBasePrice" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"useBasePrice"},
		  @"allowManufacture" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"allowManufacture"},
		  @"allowRecycler" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"allowRecycler"},
		  @"anchored" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"anchored"},
		  @"anchorable" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"anchorable"},
		  @"fittableNonSingleton" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"fittableNonSingleton"},
		  @"published" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"published"}
		  };
	return map;
}

+ (id) invGroupWithGroupID: (int32_t)aGroupID error:(NSError **)errorPtr {
	return [[EVEDBInvGroup alloc] initWithGroupID:aGroupID error:errorPtr];
}

- (id) initWithGroupID: (int32_t)aGroupID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invGroups WHERE groupID=%d;", aGroupID]
								   error:errorPtr]) {
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
	if (self.categoryID == 0)
		return nil;
	if (!_category) {
		_category = [EVEDBInvCategory invCategoryWithCategoryID:self.categoryID error:nil];
		if (!_category)
			_category = (EVEDBInvCategory*) [NSNull null];
	}
	if ((NSNull*) _category == [NSNull null])
		return nil;
	else
		return _category;
}

- (EVEDBEveIcon*) icon {
	if (self.iconID == 0)
		return nil;
	if (!_icon) {
		_icon = [EVEDBEveIcon eveIconWithIconID:self.iconID error:nil];
		if (!_icon)
			_icon = (EVEDBEveIcon*) [NSNull null];
	}
	if ((NSNull*) _icon == [NSNull null])
		return nil;
	else
		return _icon;
}

@end
