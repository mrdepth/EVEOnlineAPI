//
//  EVEKillNetAPI.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 25.10.12.
//
//

#ifndef EVEOnlineAPI_EVEKillNetAPI_h
#define EVEOnlineAPI_EVEKillNetAPI_h

#define EVEKillNetAPIErrorDomain @"EVEMetricsAPI"

typedef enum {
	EVEKillNetAPIErrorCodeParsingError = 1
} EVEKillNetAPIErrorCodes;

#define EVEKillNetAPIErrorCodeParsingErrorText @"Result parsing error"

#import "EVEKillNetLog.h"

#endif
