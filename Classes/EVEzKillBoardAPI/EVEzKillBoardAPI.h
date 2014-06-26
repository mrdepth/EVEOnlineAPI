//
//  EVEzKillBoardAPI.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 25.02.14.
//
//

#ifndef EVEOnlineAPI_EVEzKillBoardAPI_h
#define EVEOnlineAPI_EVEzKillBoardAPI_h

#import "EVEzKillBoardSearch.h"

#define EVEzKillBoardAPIHost @"https://zkillboard.com/api/"

#define EVEzKillBoardAPIErrorDomain @"EVEMetricsAPI"

typedef enum {
	EVEzKillBoardAPIErrorCodeParsingError = 1
} EVEzKillBoardAPIErrorCodes;

#define EVEzKillBoardAPIErrorCodeParsingErrorText @"Result parsing error"


#endif
