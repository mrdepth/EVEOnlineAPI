//
//  EVEKills.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEKillsItem : EVEObject
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) int32_t shipKills;
@property (nonatomic) int32_t factionKills;
@property (nonatomic) int32_t podKills;
@end


@interface EVEKills : EVEResult
@property (nonatomic, strong) NSArray *solarSystems;
@end