//
//  EVEDBDgmAttributeCategory.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDgmAttributeCategory.h"

@implementation EVEDBDgmAttributeCategory

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"categoryID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"categoryID"},
		  @"categoryName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"categoryName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"}
		  };
	return map;
}

+ (id) dgmAttributeCategoryWithAttributeCategoryID: (NSInteger)attributeCategoryID error:(NSError **)errorPtr {
	return [[self alloc] initWithAttributeCategoryID:attributeCategoryID error:errorPtr];
}

- (id) initWithAttributeCategoryID: (NSInteger)attributeCategoryID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from dgmAttributeCategories WHERE categoryID=%d;", attributeCategoryID]
								   error:errorPtr]) {
	}
	return self;
}

@end
