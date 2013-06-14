//
//  EVEDBInvTypeMaterial.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBInvTypeMaterial.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvType.h"

@implementation EVEDBInvTypeMaterial

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"materialTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"materialTypeID"},
		  @"quantity" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"quantity"}
		  };
	return map;
}

- (EVEDBInvType*) type {
	if (self.typeID == 0)
		return NULL;
	if (!_type) {
		_type = [EVEDBInvType invTypeWithTypeID:self.typeID error:nil];
		if (!_type)
			_type = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _type == [NSNull null])
		return NULL;
	else
		return _type;
}

- (EVEDBInvType*) materialType {
	if (self.materialTypeID == 0)
		return NULL;
	if (!_materialType) {
		_materialType = [EVEDBInvType invTypeWithTypeID:self.materialTypeID error:nil];
		if (!_materialType)
			_materialType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _materialType == [NSNull null])
		return NULL;
	else
		return _materialType;
}

@end