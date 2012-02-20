//
//  EVEDBStaStation.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBMapRegion;
@class EVEDBMapConstellation;
@class EVEDBMapSolarSystem;
@interface EVEDBStaStation : NSObject {
	NSInteger stationID;
	NSInteger security;
	float dockingCostPerVolume;
	float maxShipVolumeDockable;
	NSInteger officeRentalCost;
	NSInteger operationID;
	NSInteger stationTypeID;
	NSInteger corporationID;
	NSInteger solarSystemID;
	EVEDBMapSolarSystem *solarSystem;
	NSInteger constellationID;
	EVEDBMapConstellation *constellation;
	NSInteger regionID;
	EVEDBMapRegion *region;
	NSString *stationName;
	float reprocessingEfficiency;
	float reprocessingStationsTake;
	NSInteger reprocessingHangarFlag;
}
@property(nonatomic) NSInteger stationID;
@property(nonatomic) NSInteger security;
@property(nonatomic) float dockingCostPerVolume;
@property(nonatomic) float maxShipVolumeDockable;
@property(nonatomic) NSInteger officeRentalCost;
@property(nonatomic) NSInteger operationID;
@property(nonatomic) NSInteger stationTypeID;
@property(nonatomic) NSInteger corporationID;
@property(nonatomic) NSInteger solarSystemID;
@property(nonatomic, retain) EVEDBMapSolarSystem *solarSystem;
@property(nonatomic) NSInteger constellationID;
@property(nonatomic, retain) EVEDBMapConstellation *constellation;
@property(nonatomic) NSInteger regionID;
@property(nonatomic, retain) EVEDBMapRegion *region;
@property(nonatomic, retain) NSString *stationName;
@property(nonatomic) float reprocessingEfficiency;
@property(nonatomic) float reprocessingStationsTake;
@property(nonatomic) NSInteger reprocessingHangarFlag;


+ (id) staStationWithStationID: (NSInteger)aStationID error:(NSError **)errorPtr;
+ (id) staStationWithDictionary: (NSDictionary*) dictionary;
- (id) initWithStationID: (NSInteger)aStationID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
