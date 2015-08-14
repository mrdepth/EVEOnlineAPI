//
//  EVEMarketOrders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMarketOrdersItem : EVEObject
@property (nonatomic) int32_t orderID;
@property (nonatomic) int32_t charID;
@property (nonatomic) int32_t stationID;
@property (nonatomic) int32_t volEntered;
@property (nonatomic) int32_t volRemaining;
@property (nonatomic) int32_t minVolume;
@property (nonatomic) EVEOrderState orderState;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t range;
@property (nonatomic) int32_t accountKey;
@property (nonatomic) int32_t duration;
@property (nonatomic) float escrow;
@property (nonatomic) float price;
@property (nonatomic) BOOL bid;
@property (nonatomic, strong) NSDate *issued;

@end


@interface EVEMarketOrders : EVEResult
@property (nonatomic, strong) NSArray *orders;
@end

