//
//  EVEDBInvType+Installation.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvType+Installation.h"
#import "EVEDBDatabase.h"
#import "EVEDBRamInstallationTypeContent.h"
#import <objc/runtime.h>

@implementation EVEDBInvType (Installation)

- (NSArray*) installations {
	NSMutableArray *installations = objc_getAssociatedObject(self, @"installations");
	if (!installations) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		installations = [NSMutableArray array];
		objc_setAssociatedObject(self, @"installations", installations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		
		[database execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM ramInstallationTypeContents WHERE installationTypeID=%d;", self.typeID]
					 resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
						 EVEDBRamInstallationTypeContent *installation = [[EVEDBRamInstallationTypeContent alloc] initWithStatement:stmt];
						 //installation.installationType = self;
						 [installations addObject:installation];
					 }];
	}
	return installations;
}

@end
