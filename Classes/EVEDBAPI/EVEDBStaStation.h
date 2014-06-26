//
//  EVEDBStaStation.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBMapRegion;
@class EVEDBMapConstellation;
@class EVEDBMapSolarSystem;
@interface EVEDBStaStation : EVEDBObject
@property(nonatomic) int32_t stationID;
@property(nonatomic) int32_t security;
@property(nonatomic) float dockingCostPerVolume;
@property(nonatomic) float maxShipVolumeDockable;
@property(nonatomic) int32_t officeRentalCost;
@property(nonatomic) int32_t operationID;
@property(nonatomic) int32_t stationTypeID;
@property(nonatomic) int32_t corporationID;
@property(nonatomic) int32_t solarSystemID;
@property(nonatomic, strong) EVEDBMapSolarSystem *solarSystem;
@property(nonatomic) int32_t constellationID;
@property(nonatomic, strong) EVEDBMapConstellation *constellation;
@property(nonatomic) int32_t regionID;
@property(nonatomic, strong) EVEDBMapRegion *region;
@property(nonatomic, strong) NSString *stationName;
@property(nonatomic) float reprocessingEfficiency;
@property(nonatomic) float reprocessingStationsTake;
@property(nonatomic) int32_t reprocessingHangarFlag;


+ (id) staStationWithStationID: (int32_t)aStationID error:(NSError **)errorPtr;
- (id) initWithStationID: (int32_t)aStationID error:(NSError **)errorPtr;

@end
