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
@property (nonatomic) NSInteger itemID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger groupID;
@property(nonatomic) NSInteger solarSystemID;
@property (nonatomic, strong) EVEDBMapSolarSystem *solarSystem;
@property (nonatomic) NSInteger constellationID;
@property (nonatomic, strong) EVEDBMapConstellation *constellation;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, strong) EVEDBMapRegion *region;
@property (nonatomic) NSInteger orbitID;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;
@property (nonatomic) double radius;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic) double security;
@property (nonatomic) NSInteger celestialIndex;
@property (nonatomic) NSInteger orbitIndex;

+ (id) mapDenormalizeWithItemID: (NSInteger) aItemID error:(NSError **)errorPtr;
- (id) initWithItemID: (NSInteger) aItemID error:(NSError **)errorPtr;

@end
