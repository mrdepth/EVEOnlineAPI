//
//  EVEDBMapRegion.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBMapRegion : EVEDBObject
@property(nonatomic) int32_t regionID;
@property(nonatomic, strong) NSString *regionName;
@property(nonatomic) int32_t factionID;
@property(nonatomic) float radius;


+ (id) mapRegionWithRegionID: (int32_t)aRegionID error:(NSError **)errorPtr;
- (id) initWithRegionID: (int32_t)aRegionID error:(NSError **)errorPtr;
@end
