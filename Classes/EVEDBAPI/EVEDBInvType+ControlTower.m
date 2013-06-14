//
//  EVEDBInvType+ControlTower.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvType+ControlTower.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvControlTowerResource.h"
#import <objc/runtime.h>

@implementation EVEDBInvType(ControlTower)

- (NSArray*) resources {
	NSMutableArray *resources = objc_getAssociatedObject(self, @"resources");
	if (!resources) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		resources = [NSMutableArray array];
		objc_setAssociatedObject(self, @"resources", resources, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invControlTowerResources WHERE controlTowerTypeID=%d;", self.typeID]
					 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
						 EVEDBInvControlTowerResource *resource = [[EVEDBInvControlTowerResource alloc] initWithStatement:stmt];
						 [resources addObject:resource];
					 }];
	}
	return resources;
}


@end
