//
//  EVECharStandings.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"


@interface EVEStandingsItem : EVEObject
@property (nonatomic) int32_t fromID;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic) float standing;
@end


@interface EVEStandingsNPCStandings : EVEObject
@property (nonatomic, strong) NSArray *agents;
@property (nonatomic, strong) NSArray *npcCorporations;
@property (nonatomic, strong) NSArray *factions;

@end


@interface EVECharStandings : EVEResult
@property (nonatomic, strong) EVEStandingsNPCStandings *characterNPCStandings;
@end
