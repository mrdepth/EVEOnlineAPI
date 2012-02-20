/*
 *  BCGlobals.h
 *  EVEOnlineAPI
 *
 *  Created by Artem Shimanski on 5/14/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#define BattleClinicAPIHost @"http://api.battleclinic.com/api_common.php?wsdl"
#define BattleClinicErrorDomain @"BattleClinicAPI"

typedef enum {
	BattleClinicErrorCodeParsingError = 1
} BattleClinicErrorCodes;

#define BattleClinicErrorCodeParsingErrorText @"Result parsing error"