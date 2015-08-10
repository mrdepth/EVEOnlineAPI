//
//  EVEOutpostList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEOutpostListItem : EVEObject
@property (nonatomic) int32_t stationID;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, strong) NSString *stationName;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) float dockingCostPerShipVolume;
@property (nonatomic) float officeRentalCost;
@property (nonatomic) int32_t stationTypeID;
@property (nonatomic) float reprocessingEfficiency;
@property (nonatomic) float reprocessingStationTake;
@property (nonatomic) int32_t standingOwnerID;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;
@end

@interface EVEOutpostList : EVEResult
@property (nonatomic, strong) NSArray *corporationStarbases;
@end