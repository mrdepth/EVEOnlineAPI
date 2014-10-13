//
//  EVEDBRamActivity.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBRamActivity.h"

@implementation EVEDBRamActivity
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"activityName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"activityName"},
		  @"iconNo" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"iconNo"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"published" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"published"}
		  };
	return map;
}

+ (id) ramActivityWithActivityID: (int32_t)activityID error:(NSError **)errorPtr {
	return [[EVEDBRamActivity alloc] initWithActivityID:activityID error:errorPtr];
}

- (id) initWithActivityID: (int32_t)activityID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from ramActivities WHERE activityID=%d;", activityID]
								   error:errorPtr]) {
	}
	return self;
}

- (NSString*) iconImageName {
	return [NSString stringWithFormat:@"Icons/icon%@.png", self.iconNo];
}

@end