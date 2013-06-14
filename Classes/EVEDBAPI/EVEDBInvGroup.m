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

+ (id) invGroupWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr {
	return [[EVEDBInvGroup alloc] initWithGroupID:aGroupID error:errorPtr];
}

- (id) initWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr {
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
		return NULL;
	if (!_category) {
		_category = [EVEDBInvCategory invCategoryWithCategoryID:self.categoryID error:nil];
		if (!_category)
			_category = (EVEDBInvCategory*) [NSNull null];
	}
	if ((NSNull*) _category == [NSNull null])
		return NULL;
	else
		return _category;
}

- (EVEDBEveIcon*) icon {
	if (self.iconID == 0)
		return NULL;
	if (!_icon) {
		_icon = [EVEDBEveIcon eveIconWithIconID:self.iconID error:nil];
		if (!_icon)
			_icon = (EVEDBEveIcon*) [NSNull null];
	}
	if ((NSNull*) _icon == [NSNull null])
		return NULL;
	else
		return _icon;
}

@end
