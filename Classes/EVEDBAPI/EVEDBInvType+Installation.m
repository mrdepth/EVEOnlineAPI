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

- (void) didReceiveInstallation: (NSDictionary*) dictionary {
	NSMutableArray *installations = objc_getAssociatedObject(self, @"installations");
	EVEDBRamInstallationTypeContent *installation = [EVEDBRamInstallationTypeContent ramInstallationTypeContentWithDictionary:dictionary];
	installation.installationType = self;
	[installations addObject:installation];
}

- (NSArray*) installations {
	NSMutableArray *installations = objc_getAssociatedObject(self, @"installations");
	if (!installations) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		installations = [NSMutableArray array];
		objc_setAssociatedObject(self, @"installations", installations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		
		[database execWithSQLRequest:[NSString stringWithFormat:@"SELECT * FROM ramInstallationTypeContents WHERE installationTypeID=%d;", typeID]
							  target:self
							  action:@selector(didReceiveInstallation:)];
	}
	return installations;
}

@end
