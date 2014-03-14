//
//  EVEDBInvControlTowerResourcePurpose.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBInvControlTowerResourcePurpose.h"


@implementation EVEDBInvControlTowerResourcePurpose

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"purpose" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"purposeID"},
		  @"purposeText" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"purposeText"}
		  };
	return map;
}

+ (id) invControlTowerResourcePurposeWithPurposeID: (int32_t)aPurposeID error:(NSError **)errorPtr {
	return [[EVEDBInvControlTowerResourcePurpose alloc] initWithPurposeID:aPurposeID error:errorPtr];
}

- (id) initWithPurposeID: (int32_t)purposeID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from invControlTowerResourcePurposes WHERE purpose=%d;", purposeID]
								   error:errorPtr]) {
	}
	return self;
}


@end