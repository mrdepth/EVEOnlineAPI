//
//  EVEDBDgmAttributeType.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmAttributeType.h"
#import "EVEDBDgmAttributeCategory.h"
#import "EVEDBEveIcon.h"
#import "EVEDBEveUnit.h"


@implementation EVEDBDgmAttributeType

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"attributeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"attributeID"},
		  @"attributeName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"attributeName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"defaultValue" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"defaultValue"},
		  @"published" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"published"},
		  @"displayName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"displayName"},
		  @"unitID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"unitID"},
		  @"stackable" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"stackable"},
		  @"highIsGood" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"highIsGood"},
		  @"categoryID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"categoryID"}
		  };
	return map;
}

+ (id) dgmAttributeTypeWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr {
	return [[EVEDBDgmAttributeType alloc] initWithAttributeTypeID:aAttributeTypeID error:errorPtr];
}

- (id) initWithAttributeTypeID: (NSInteger)attributeTypeID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from dgmAttributeTypes WHERE attributeID=%d;", attributeTypeID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBDgmAttributeCategory*) category {
	if (self.categoryID == 0)
		return nil;
	if (!_category) {
		_category = [EVEDBDgmAttributeCategory dgmAttributeCategoryWithAttributeCategoryID:self.categoryID error:nil];
		if (!_category)
			_category = (EVEDBDgmAttributeCategory*) [NSNull null];
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


- (EVEDBEveUnit*) unit {
	if (self.unitID == 0)
		return nil;
	if (!_unit) {
		_unit = [EVEDBEveUnit eveUnitWithUnitID:self.unitID error:nil];
		if (!_unit)
			_unit = (EVEDBEveUnit*) [NSNull null];
	}
	if ((NSNull*) _unit == [NSNull null])
		return nil;
	else
		return _unit;
}

@end
