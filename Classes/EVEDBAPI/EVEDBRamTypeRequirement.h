//
//  EVEDBRamTypeRequirement.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBObject.h"

@class EVEDBInvType;
@class EVEDBRamActivity;
@interface EVEDBRamTypeRequirement : EVEDBObject
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) EVEDBInvType* type;
@property (nonatomic) int32_t activityID;
@property (nonatomic, strong) EVEDBRamActivity* activity;
@property (nonatomic) int32_t requiredTypeID;
@property (nonatomic, strong) EVEDBInvType* requiredType;
@property (nonatomic) int32_t quantity;
@property (nonatomic) float damagePerJob;
@property (nonatomic) int32_t recycle;


@end