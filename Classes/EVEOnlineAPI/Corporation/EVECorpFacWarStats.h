//
//  EVECorpFacWarStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECorpFacWarStats : EVEResult
@property (nonatomic) int32_t factionID;
@property (nonatomic, strong) NSString *factionName;
@property (nonatomic, strong) NSDate *enlisted;
@property (nonatomic) int32_t pilots;
@property (nonatomic) int32_t killsYesterday;
@property (nonatomic) int32_t killsLastWeek;
@property (nonatomic) int32_t killsTotal;
@property (nonatomic) int32_t victoryPointsYesterday;
@property (nonatomic) int32_t victoryPointsLastWeek;
@property (nonatomic) int32_t victoryPointsTotal;
@end
