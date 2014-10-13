//
//  EVEDBRamAssemblyLineType.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBRamAssemblyLineType.h"
#import "EVEDBRamActivity.h"


@implementation EVEDBRamAssemblyLineType
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"assemblyLineTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"assemblyLineTypeID"},
		  @"assemblyLineTypeName" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"assemblyLineTypeName"},
		  @"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
		  @"baseTimeMultiplier" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"baseTimeMultiplier"},
		  @"baseMaterialMultiplier" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"baseMaterialMultiplier"},
		  @"volume" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"volume"},
		  @"activityID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"activityID"},
		  @"minCostPerHour" : @{@"type" : @(EVEDBTypeFloat), @"keyPath" : @"minCostPerHour"}
		  };
	return map;
}

+ (id) ramAssemblyLineTypeWithAssemblyLineTypeID: (int32_t)assemblyLineTypeID error:(NSError **)errorPtr {
	return [[EVEDBRamAssemblyLineType alloc] initWithAssemblyLineTypeID:assemblyLineTypeID error:errorPtr];
}

- (id) initWithAssemblyLineTypeID: (int32_t)assemblyLineTypeID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from ramAssemblyLineTypes WHERE assemblyLineTypeID=%d;", assemblyLineTypeID]
								   error:errorPtr]) {
	}
	return self;
}


- (EVEDBRamActivity*) activity {
	if (self.activityID == 0)
		return nil;
	if (!_activity) {
		_activity = [EVEDBRamActivity ramActivityWithActivityID:self.activityID error:nil];
		if (!_activity)
			_activity = (EVEDBRamActivity*) [NSNull null];
	}
	if ((NSNull*) _activity == [NSNull null])
		return nil;
	else
		return _activity;
}

@end