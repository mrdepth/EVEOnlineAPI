//
//  EVEKillMails.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEKillMailsVictim : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, strong) NSString *allianceName;
@property (nonatomic) int32_t factionID;
@property (nonatomic, strong) NSString *factionName;
@property (nonatomic) int32_t damageTaken;
@property (nonatomic) int32_t shipTypeID;
@end

@interface EVEKillMailsAttacker : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, strong) NSString *allianceName;
@property (nonatomic) int32_t factionID;
@property (nonatomic, strong) NSString *factionName;
@property (nonatomic) float securityStatus;
@property (nonatomic) int32_t damageDone;
@property (nonatomic) BOOL finalBlow;
@property (nonatomic) int32_t weaponTypeID;
@property (nonatomic) int32_t shipTypeID;
@end

@interface EVEKillMailsItem : EVEObject
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) int32_t qtyDropped;
@property (nonatomic) int32_t qtyDestroyed;
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic) BOOL singleton;
@end

@interface EVEKillMailsKill : EVEObject
@property (nonatomic) int32_t killID;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) NSDate *killTime;
@property (nonatomic) int32_t moonID;
@property (nonatomic, strong) EVEKillMailsVictim *victim;
@property (nonatomic, strong) NSArray *attackers;
@property (nonatomic, strong) NSArray *items;
@end


@interface EVEKillMails : EVEResult
@property (nonatomic, strong) NSArray *kills;
@end
