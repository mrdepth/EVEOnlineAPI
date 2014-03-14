//
//  EVEDBMapDenormalize.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBMapRegion;
@class EVEDBMapConstellation;
@class EVEDBMapSolarSystem;
@interface EVEDBMapDenormalize : EVEDBObject
@property (nonatomic) int32_t itemID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t groupID;
@property(nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) EVEDBMapSolarSystem *solarSystem;
@property (nonatomic) int32_t constellationID;
@property (nonatomic, strong) EVEDBMapConstellation *constellation;
@property (nonatomic) int32_t regionID;
@property (nonatomic, strong) EVEDBMapRegion *region;
@property (nonatomic) int32_t orbitID;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;
@property (nonatomic) double radius;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic) double security;
@property (nonatomic) int32_t celestialIndex;
@property (nonatomic) int32_t orbitIndex;

+ (id) mapDenormalizeWithItemID: (int32_t) aItemID error:(NSError **)errorPtr;
- (id) initWithItemID: (int32_t) aItemID error:(NSError **)errorPtr;

@end
