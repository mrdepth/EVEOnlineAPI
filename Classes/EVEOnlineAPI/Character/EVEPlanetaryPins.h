//
//  EVEPlanetaryPins.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEResult.h"

@interface EVEPlanetaryPinsItem : EVEObject
@property (nonatomic) int64_t pinID;
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic) int32_t schematicID;
@property (nonatomic, strong) NSDate *lastLaunchTime;
@property (nonatomic) int32_t cycleTime;
@property (nonatomic) int32_t quantityPerCycle;
@property (nonatomic, strong) NSDate *installTime;
@property (nonatomic, strong) NSDate *expiryTime;
@property (nonatomic) int32_t contentTypeID;
@property (nonatomic, strong) NSString *contentTypeName;
@property (nonatomic) int32_t contentQuantity;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@end

@interface EVEPlanetaryPins : EVEResult
@property (nonatomic, strong) NSArray *pins;
@end

