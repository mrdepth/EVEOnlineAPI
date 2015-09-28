//
//  EVECentralQuickLook.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"

@interface EVECentralQuickLookOrder: EVEObject
@property (nonatomic) int32_t orderID;
@property (nonatomic) int32_t regionID;
@property (nonatomic) int32_t stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) float security;
@property (nonatomic) int32_t range;
@property (nonatomic) float price;
@property (nonatomic) int32_t volRemain;
@property (nonatomic) int32_t minVolume;
@property (nonatomic, strong) NSDate *expires;
@property (nonatomic, strong) NSDate *reportedTime;
@end

@interface EVECentralQuickLook : EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t hours;
@property (nonatomic) int32_t minQ;
@property (nonatomic, strong) NSArray* sellOrders;
@property (nonatomic, strong) NSArray* buyOrders;

@end
