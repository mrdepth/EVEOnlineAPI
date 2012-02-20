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

- (void) didReceiveResource: (NSDictionary*) dictionary {
	NSMutableArray *resources = objc_getAssociatedObject(self, @"resources");
	EVEDBInvControlTowerResource *resource = [EVEDBInvControlTowerResource invControlTowerResourceWithDictionary:dictionary];
	[resources addObject:resource];
}

- (NSArray*) resources {
	NSMutableArray *resources = objc_getAssociatedObject(self, @"resources");
	if (!resources) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		resources = [NSMutableArray array];
		objc_setAssociatedObject(self, @"resources", resources, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		
		[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM invControlTowerResources WHERE controlTowerTypeID=%d;", typeID]
							  target:self
							  action:@selector(didReceiveResource:)];
	}
	return resources;
}


@end
