//
//  EVEDBMapConstellation.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBMapRegion;
@interface EVEDBMapConstellation : EVEDBObject
@property(nonatomic) int32_t regionID;
@property(nonatomic, strong) EVEDBMapRegion *region;
@property(nonatomic) int32_t constellationID;
@property(nonatomic, strong) NSString *constellationName;
@property(nonatomic) int32_t factionID;
@property(nonatomic) float radius;

+ (id) mapConstellationWithConstellationID: (int32_t)aConstellationID error:(NSError **)errorPtr;
- (id) initWithConstellationID: (int32_t)aConstellationID error:(NSError **)errorPtr;

@end
