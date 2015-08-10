//
//  EVEPlanetaryRoutes.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEResult.h"

@interface EVEPlanetaryRoutesItem : EVEObject
@property (nonatomic) int64_t routeID;
@property (nonatomic) int64_t sourcePinID;
@property (nonatomic) int64_t destinationPinID;
@property (nonatomic) int32_t contentTypeID;
@property (nonatomic, strong) NSString *contentTypeName;
@property (nonatomic) int32_t quantity;
@property (nonatomic) int64_t waypoint1;
@property (nonatomic) int64_t waypoint2;
@property (nonatomic) int64_t waypoint3;
@property (nonatomic) int64_t waypoint4;
@property (nonatomic) int64_t waypoint5;
@end

@interface EVEPlanetaryRoutes : EVEResult
@property (nonatomic, strong) NSArray *routes;
@end

