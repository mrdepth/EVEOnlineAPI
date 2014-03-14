//
//  EVEDBInvControlTowerResource.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBInvControlTowerResourcePurpose;
@class EVEDBInvType;
@interface EVEDBInvControlTowerResource : EVEDBObject
@property (nonatomic) int32_t controlTowerTypeID;
@property (nonatomic) int32_t resourceTypeID;
@property (nonatomic, strong) EVEDBInvType *resourceType;
@property (nonatomic) int32_t purposeID;
@property (nonatomic) int32_t quantity;
@property (nonatomic, strong) EVEDBInvControlTowerResourcePurpose *purpose;
@property (nonatomic) double minSecurityLevel;
@property (nonatomic) int32_t factionID;

@end
