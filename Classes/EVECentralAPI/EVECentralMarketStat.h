//
//  EVECentralMarketStat.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"

@interface EVECentralMarketStatTypeStat : EVEObject
@property (nonatomic) float volume;
@property (nonatomic) float avg;
@property (nonatomic) float max;
@property (nonatomic) float min;
@property (nonatomic) float stddev;
@property (nonatomic) float median;
@property (nonatomic) float percentile;

@end


@interface EVECentralMarketStatType: EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) EVECentralMarketStatTypeStat *all;
@property (nonatomic, strong) EVECentralMarketStatTypeStat *buy;
@property (nonatomic, strong) EVECentralMarketStatTypeStat *sell;
@end

@interface EVECentralMarketStat : EVEObject
@property (nonatomic, strong) EVECentralMarketStatType *type;
@end
