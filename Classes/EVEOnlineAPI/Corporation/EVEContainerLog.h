//
//  EVEContainerLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"
#import "EVEGlobals.h"

@interface EVEContainerLogItem : EVEObject
@property (nonatomic, strong) NSDate *logTime;
@property (nonatomic) int64_t itemID;
@property (nonatomic) int32_t itemTypeID;
@property (nonatomic) int32_t actorID;
@property (nonatomic, strong) NSString *actorName;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) int64_t locationID;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSString *passwordType;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;
@property (nonatomic, strong) NSString *oldConfiguration;
@property (nonatomic, strong) NSString *theNewConfiguration;
@end

@interface EVEContainerLog : EVEResult
@property (nonatomic, strong) NSArray *containerLog;
@end
