//
//  EVEDBCrtCategory.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtCategory.h"

@implementation EVEDBCrtCategory
@synthesize description = _description;


+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"categoryID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"categoryID"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"categoryName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"categoryName"}
		  };
	return map;
}

+ (id) crtCategoryWithCategoryID: (int32_t)categoryID error:(NSError **)errorPtr {
	return [[EVEDBCrtCategory alloc] initWithCategoryID:categoryID error:errorPtr];
}

- (id) initWithCategoryID: (int32_t)categoryID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtCategories WHERE categoryID=%d;", categoryID]
								   error:errorPtr]) {
	}
	return self;
}

@end