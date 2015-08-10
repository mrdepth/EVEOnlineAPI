//
//  EVEPlanetaryLinks.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEResult.h"

@interface EVEPlanetaryLinksItem : EVEObject
@property (nonatomic) int64_t sourcePinID;
@property (nonatomic) int64_t destinationPinID;
@property (nonatomic) int32_t linkLevel;
@end

@interface EVEPlanetaryLinks : EVEResult
@property (nonatomic, strong) NSArray *links;
@end

