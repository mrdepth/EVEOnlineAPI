//
//  EVEStarbaseList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEStarbaseListItem : EVEObject
@property (nonatomic) int64_t itemID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t locationID;
@property (nonatomic) int32_t moonID;
@property (nonatomic) EVEPOSState state;
@property (nonatomic, strong) NSDate *stateTimestamp;
@property (nonatomic, strong) NSDate *onlineTimestamp;
@property (nonatomic) int32_t standingOwnerID;
@end

@interface EVEStarbaseList : EVEResult
@property (nonatomic, strong) NSArray *starbases;
@end