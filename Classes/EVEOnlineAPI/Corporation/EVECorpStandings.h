//
//  EVECorpStandings.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.08.15.
//
//

#import "EVECharStandings.h"

@interface EVECorpStandings : EVEResult
@property (nonatomic, strong) EVEStandingsNPCStandings *corporationNPCStandings;
@end
