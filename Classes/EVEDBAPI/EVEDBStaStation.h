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
@property(nonatomic) NSInteger stationID;
@property(nonatomic) NSInteger security;
@property(nonatomic) float dockingCostPerVolume;
@property(nonatomic) float maxShipVolumeDockable;
@property(nonatomic) NSInteger officeRentalCost;
@property(nonatomic) NSInteger operationID;
@property(nonatomic) NSInteger stationTypeID;
@property(nonatomic) NSInteger corporationID;
@property(nonatomic) NSInteger solarSystemID;
@property(nonatomic, strong) EVEDBMapSolarSystem *solarSystem;
@property(nonatomic) NSInteger constellationID;
@property(nonatomic, strong) EVEDBMapConstellation *constellation;
@property(nonatomic) NSInteger regionID;
@property(nonatomic, strong) EVEDBMapRegion *region;
@property(nonatomic, strong) NSString *stationName;
@property(nonatomic) float reprocessingEfficiency;
@property(nonatomic) float reprocessingStationsTake;
@property(nonatomic) NSInteger reprocessingHangarFlag;


+ (id) staStationWithStationID: (NSInteger)aStationID error:(NSError **)errorPtr;
- (id) initWithStationID: (NSInteger)aStationID error:(NSError **)errorPtr;

@end
