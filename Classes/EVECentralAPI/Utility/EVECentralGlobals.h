/*
 *  EVECentralGlobals.h
 *  EVEOnlineAPI
 *
 *  Created by Artem Shimanski on 1/9/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#define EVECentralAPIHost @"http://api.eve-central.com"
#define EVECentralErrorDomain @"EVECentralAPI"

typedef enum {
	EVECentralErrorCodeParsingError = 1
} EVECentralErrorCodes;

#define EVECentralErrorCodeParsingErrorText @"Result parsing error"