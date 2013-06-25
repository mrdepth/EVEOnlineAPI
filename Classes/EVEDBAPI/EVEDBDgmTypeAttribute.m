//
//  EVEDBDgmTypeAttribute.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmTypeAttribute.h"
#import "EVEDBDgmAttributeType.h"


@implementation EVEDBDgmTypeAttribute

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
		  @"attributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"attributeID"},
		  @"value" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"value"}
		  };
	return map;
}



- (EVEDBDgmAttributeType*) attribute {
	if (self.attributeID == 0)
		return NULL;
	if (!_attribute) {
		_attribute = [EVEDBDgmAttributeType dgmAttributeTypeWithAttributeTypeID:self.attributeID error:nil];
		if (!_attribute)
			_attribute = (EVEDBDgmAttributeType*) [NSNull null];
	}
	if ((NSNull*) _attribute == [NSNull null])
		return NULL;
	else
		return _attribute;
}

@end
