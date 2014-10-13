//
//  EVEDBInvMarketGroup.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvMarketGroup.h"
#import "EVEDBEveIcon.h"

@implementation EVEDBInvMarketGroup
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"marketGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"marketGroupID"},
		  @"parentGroupID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"parentGroupID"},
		  @"marketGroupName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"marketGroupName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"hasTypes" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"hasTypes"}
		  };
	return map;
}

+ (id) invMarketGroupWithMarketGroupID: (int32_t)aMarketGroupID error:(NSError **)errorPtr {
	return [[EVEDBInvMarketGroup alloc] initWithMarketGroupID:aMarketGroupID error:errorPtr];
}

- (id) initWithMarketGroupID: (int32_t)aMarketGroupID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invMarketGroups WHERE marketGroupID=%d;", aMarketGroupID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBInvMarketGroup*) parentGroup {
	if (self.parentGroupID == 0)
		return nil;
	if (!_parentGroup) {
		_parentGroup = [EVEDBInvMarketGroup invMarketGroupWithMarketGroupID:self.parentGroupID error:nil];
		if (!_parentGroup)
			_parentGroup = (EVEDBInvMarketGroup*) [NSNull null];
	}
	if ((NSNull*) _parentGroup == [NSNull null])
		return nil;
	else
		return _parentGroup;
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
