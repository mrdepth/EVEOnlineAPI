//
//  EVEFacWarSystems.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEFacWarSystemsItem : EVEObject
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) NSString *solarSystemName;
@property (nonatomic) int32_t occupyingFactionID;
@property (nonatomic, strong) NSString *occupyingFactionName;
@property (nonatomic) int32_t owningFactionID;
@property (nonatomic, strong) NSString *owningFactionName;
@property (nonatomic) BOOL contested;
@property (nonatomic) int32_t victoryPoints;
@property (nonatomic) int32_t victoryPointThreshold;
@end


@interface EVEFacWarSystems : EVEResult
@property (nonatomic, strong) NSArray *solarSystems;
@end