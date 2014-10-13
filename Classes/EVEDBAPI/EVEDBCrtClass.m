//
//  EVEDBCrtClass.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtClass.h"
#import "EVEDBDatabase.h"

@implementation EVEDBCrtClass
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"classID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"classID"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"className" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"className"}
		  };
	return map;
}

+ (id) crtClassWithClassID: (int32_t)classID error:(NSError **)errorPtr {
	return [[EVEDBCrtClass alloc] initWithClassID:classID error:errorPtr];
}

- (id) initWithClassID: (int32_t)classID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtClasses WHERE classID=%d;", classID]
								   error:errorPtr]) {
	}
	return self;
}

@end