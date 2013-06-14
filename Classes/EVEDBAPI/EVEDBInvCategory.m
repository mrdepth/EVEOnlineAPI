//
//  EVEDBInvCategory.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvCategory.h"
#import "EVEDBDatabase.h"
#import "EVEDBEveIcon.h"

@implementation EVEDBInvCategory

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"categoryID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"categoryID"},
		  @"categoryName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"categoryName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"iconID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"iconID"},
		  @"published" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"published"}
		  };
	return map;
}

+ (id) invCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr {
	return [[EVEDBInvCategory alloc] initWithCategoryID:aCategoryID error:errorPtr];
}

- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invCategories WHERE categoryID=%d;", aCategoryID]
								   error:errorPtr]) {
	}
	return self;
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
