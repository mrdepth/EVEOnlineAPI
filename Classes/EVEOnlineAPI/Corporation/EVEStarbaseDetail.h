//
//  EVEStarbaseDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEStarbaseDetailGeneralSettings : EVEObject
@property (nonatomic) int32_t usageFlags;
@property (nonatomic) int32_t deployFlags;
@property (nonatomic) BOOL allowCorporationMembers;
@property (nonatomic) BOOL allowAllianceMembers;
@end

@interface EVEStarbaseDetailCombatSettings : EVEObject
@property (nonatomic) int32_t useStandingsFromOwnerID;
@property (nonatomic) int32_t onStandingDropStading;
@property (nonatomic) BOOL onStatusDropEnabled;
@property (nonatomic) int32_t onStatusDropStanding;
@property (nonatomic) BOOL onAggressionEnabled;
@property (nonatomic) int32_t onCorporationWarEnabled;
@end

@interface EVEStarbaseDetailFuelItem : EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;
@end

@interface EVEStarbaseDetail : EVEResult
@property (nonatomic) int32_t state;
@property (nonatomic, strong) NSDate *stateTimestamp;
@property (nonatomic, strong) NSDate *onlineTimestamp;
@property (nonatomic, strong) EVEStarbaseDetailGeneralSettings *generalSettings;
@property (nonatomic, strong) EVEStarbaseDetailCombatSettings *combatSettings;
@property (nonatomic, strong) NSArray *fuel;
@end