//
//  EVEKillMails.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEKillMails.h"

@implementation EVEKillMailsVictim

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"damageTaken":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVEKillMailsAttacker

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"securityStatus":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"damageDone":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"finalBlow":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"weaponTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation EVEKillMailsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"flag":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"qtyDropped":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"qtyDestroyed":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"items":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEKillMailsItem class]},
				   @"singleton":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation EVEKillMailsKill

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"killID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"moonID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victim":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEKillMailsVictim class]},
				   @"attackers":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEKillMailsAttacker class]},
				   @"items":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEKillMailsItem class]}};
	return scheme;
}

@end


@implementation EVEKillMails

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"kills":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEKillMailsKill class]}};
	
	return scheme;
}

@end
