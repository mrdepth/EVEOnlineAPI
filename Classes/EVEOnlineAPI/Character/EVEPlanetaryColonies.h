//
//  EVEPlanetaryColonies.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEResult.h"

@interface EVEPlanetaryColoniesItem : EVEObject
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) NSString *solarSystemName;
@property (nonatomic) int32_t planetID;
@property (nonatomic, strong) NSString *planetName;
@property (nonatomic) int32_t planetTypeID;
@property (nonatomic, strong) NSString *planetTypeName;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSDate *lastUpdate;
@property (nonatomic) int32_t upgradeLevel;
@property (nonatomic) int32_t numberOfPins;
@end

@interface EVEPlanetaryColonies : EVEResult
@property (nonatomic, strong) NSArray *colonies;
@end
