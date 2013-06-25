//
//  NeocomAPI.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#ifndef EVEOnlineAPI_NeocomAPI_h
#define EVEOnlineAPI_NeocomAPI_h

#import "NAPISearch.h"
#import "NAPIUpload.h"
#import "NAPILookup.h"

#define NeocomAPIHost @"http://neocom.by/api"

typedef enum {
	NeocomAPIFlagNone                = 0,
	NeocomAPIFlagCapStable           = 1 << 0,
	NeocomAPIFlagImplantsUsed        = 1 << 1,
	NeocomAPIFlagBoostersUsed        = 1 << 2,
	NeocomAPIFlagHybridTurrets       = 1 << 3,
	NeocomAPIFlagLaserTurrets        = 1 << 4,
	NeocomAPIFlagProjectileTurrets   = 1 << 5,
	NeocomAPIFlagMissileLaunchers    = 1 << 6,
	NeocomAPIFlagPassiveTank         = 1 << 7,
	NeocomAPIFlagActiveTank          = 1 << 8,
	NeocomAPIFlagShieldTank          = 1 << 9,
	NeocomAPIFlagArmorTank           = 1 << 10,
	NeocomAPIFlagPVP                 = 1 << 11,
	NeocomAPIFlagComplete            = 1 << 12,
	NeocomAPIFlagValid               = 1 << 13,
} NeocomAPIFlag;

#endif
