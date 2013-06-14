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
@property (nonatomic) NSInteger typeID;
@property (nonatomic, strong) EVEDBInvType* type;
@property (nonatomic) NSInteger activityID;
@property (nonatomic, strong) EVEDBRamActivity* activity;
@property (nonatomic) NSInteger requiredTypeID;
@property (nonatomic, strong) EVEDBInvType* requiredType;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) float damagePerJob;
@property (nonatomic) NSInteger recycle;


@end