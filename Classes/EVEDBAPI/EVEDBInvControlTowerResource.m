//
//  EVEDBInvControlTowerResource.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvControlTowerResource.h"
#import "EVEDBInvControlTowerResourcePurpose.h"
#import "EVEDBInvType.h"


@implementation EVEDBInvControlTowerResource

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"controlTowerTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"controlTowerTypeID"},
		  @"resourceTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"resourceTypeID"},
		  @"purpose" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"purposeID"},
		  @"quantity" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"quantity"},
		  @"minSecurityLevel" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"minSecurityLevel"},
		  @"factionID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"factionID"}
		  };
	return map;
}

- (EVEDBInvType*) resourceType {
	if (self.resourceTypeID == 0)
		return NULL;
	if (!_resourceType) {
		_resourceType = [EVEDBInvType invTypeWithTypeID:self.resourceTypeID error:nil];
		if (!_resourceType)
			_resourceType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _resourceType == [NSNull null])
		return NULL;
	else
		return _resourceType;
}

- (EVEDBInvControlTowerResourcePurpose*) purpose {
	if (self.purposeID == 0)
		return NULL;
	if (!_purpose) {
		_purpose = [EVEDBInvControlTowerResourcePurpose invControlTowerResourcePurposeWithPurposeID:self.purposeID error:nil];
		if (!_purpose)
			_purpose = (EVEDBInvControlTowerResourcePurpose*) [NSNull null];
	}
	if ((NSNull*) _purpose == [NSNull null])
		return NULL;
	else
		return _purpose;
}

@end