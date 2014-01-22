//
//  EVEDBRamTypeRequirement.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBRamTypeRequirement.h"
#import "EVEDBRamActivity.h"
#import "EVEDBInvType.h"


@implementation EVEDBRamTypeRequirement

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"requiredTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"requiredTypeID"},
		  @"quantity" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"quantity"},
		  @"damagePerJob" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"damagePerJob"},
		  @"recycle" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"recycle"},
		  };
	return map;
}


- (EVEDBInvType*) type {
	if (self.typeID == 0)
		return nil;
	if (!_type) {
		_type = [EVEDBInvType invTypeWithTypeID:self.typeID error:nil];
		if (!_type)
			_type = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _type == [NSNull null])
		return nil;
	else
		return _type;
}

- (EVEDBRamActivity*) activity {
	if (self.activityID == 0)
		return nil;
	if (!_activity) {
		_activity = [EVEDBRamActivity ramActivityWithActivityID:self.activityID error:nil];
		if (!_activity)
			_activity = (EVEDBRamActivity*) [NSNull null];
	}
	if ((NSNull*) _activity == [NSNull null])
		return nil;
	else
		return _activity;
}

- (EVEDBInvType*) requiredType {
	if (self.requiredTypeID == 0)
		return nil;
	if (!_requiredType) {
		_requiredType = [EVEDBInvType invTypeWithTypeID:self.requiredTypeID error:nil];
		if (!_requiredType)
			_requiredType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _requiredType == [NSNull null])
		return nil;
	else
		return _requiredType;
}

@end