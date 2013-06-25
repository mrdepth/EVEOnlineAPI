//
//  EVEDBEveUnit.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBEveUnit.h"

@implementation EVEDBEveUnit

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"unitID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"unitID"},
		  @"unitName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"unitName"},
		  @"displayName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"displayName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"}
		  };
	return map;
}

+ (id) eveUnitWithUnitID: (NSInteger)unitID error:(NSError **)errorPtr {
	return [[EVEDBEveUnit alloc] initWithUnitID:unitID error:errorPtr];
}

- (id) initWithUnitID: (NSInteger)unitID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from eveUnits WHERE unitID=%d;", unitID]
								   error:nil]) {
	}
	return self;
}

@end
