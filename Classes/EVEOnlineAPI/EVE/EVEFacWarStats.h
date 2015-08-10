//
//  EVEFacWarStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEFacWarStatsKills : EVEObject
@property (nonatomic) int32_t killsYesterday;
@property (nonatomic) int32_t killsLastWeek;
@property (nonatomic) int32_t killsTotal;
@property (nonatomic) int32_t victoryPointsYesterday;
@property (nonatomic) int32_t victoryPointsLastWeek;
@property (nonatomic) int32_t victoryPointsTotal;
@end


@interface EVEFacWarStatsFactionsItem : EVEFacWarStatsKills
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t pilots;
@property (nonatomic) int32_t systemsControlled;
@end


@interface EVEFacWarStatsFactionWarsItem : EVEObject
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t againstID;
@property (nonatomic, copy) NSString *againstName;

@end


@interface EVEFacWarStats : EVEResult
@property (nonatomic, strong) EVEFacWarStatsKills *totals;
@property (nonatomic, strong) NSArray *factions;
@property (nonatomic, strong) NSArray *factionWars;

@end