//
//  EVEFacWarTopStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEFacWarTopStatsCharactersItem : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) int32_t kills;
@end


@interface EVEFacWarTopStatsCorporationsItem : EVEObject
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) int32_t kills;
@end


@interface EVEFacWarTopStatsFactionsItem : EVEObject
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t kills;
@end


@interface EVEFacWarTopStatsItem : EVEObject
@property (nonatomic, strong) NSArray *killsYesterday;
@property (nonatomic, strong) NSArray *killsLastWeek;
@property (nonatomic, strong) NSArray *killsTotal;
@property (nonatomic, strong) NSArray *victoryPointsYesterday;
@property (nonatomic, strong) NSArray *victoryPointsLastWeek;
@property (nonatomic, strong) NSArray *victoryPointsTotal;
@end

@interface EVEFacWarTopStatsCharacters : EVEFacWarTopStatsItem
@end

@interface EVEFacWarTopStatsCorporations : EVEFacWarTopStatsItem
@end

@interface EVEFacWarTopStatsFactions : EVEFacWarTopStatsItem
@end

@interface EVEFacWarTopStats : EVEResult
@property (nonatomic, strong) EVEFacWarTopStatsCharacters *characters;
@property (nonatomic, strong) EVEFacWarTopStatsCorporations *corporations;
@property (nonatomic, strong) EVEFacWarTopStatsFactions *factions;
@end