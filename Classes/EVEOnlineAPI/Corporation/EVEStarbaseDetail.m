//
//  EVEStarbaseDetail.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStarbaseDetail.h"


@implementation EVEStarbaseDetailGeneralSettings

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"usageFlags":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"deployFlags":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allowCorporationMembers":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allowAllianceMembers":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end

@implementation EVEStarbaseDetailCombatSettings

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"useStandingsFromOwnerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"onStandingDropStading":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"onStatusDropEnabled":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"onStatusDropStanding":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"onAggressionEnabled":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"onCorporationWarEnabled":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEStarbaseDetailFuelItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEStarbaseDetail

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"state":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stateTimestamp":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"onlineTimestamp":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"generalSettings":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEStarbaseDetailGeneralSettings class]},
				   @"combatSettings":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEStarbaseDetailCombatSettings class]},
				   @"fuel":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEStarbaseDetailFuelItem class]}};
	
	return scheme;
}

@end
