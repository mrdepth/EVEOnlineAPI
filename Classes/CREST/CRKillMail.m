//
//  CRKillMail.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 09.11.15.
//
//

#import "CRKillMail.h"

@implementation CRKillMailVictim

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"character.id"},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"character.name"},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"corporation.id"},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"corporation.name"},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"alliance.id"},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"alliance.name"},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"faction.id"},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"faction.name"},
				   @"damageTaken":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"shipType.id"}};
	return scheme;
}

@end

@implementation CRKillMailAttacker

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"character.id"},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"character.name"},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"corporation.id"},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"corporation.name"},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"alliance.id"},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"alliance.name"},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"faction.id"},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString),@"elementName":@"faction.name"},
				   @"securityStatus":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"damageDone":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"finalBlow":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"weaponTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"weaponType.id"},
				   @"shipTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"shipType.id"}};
	return scheme;
}

@end

@implementation CRKillMailItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"flag":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"qtyDropped":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"quantityDropped"},
				   @"qtyDestroyed":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"quantityDestroyed"},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"itemType.id"},
				   @"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRKillMailItem class]},
				   @"singleton":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation CRKillMail


+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"killID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar),@"elementName":@"solarSystem.id"},
				   @"killTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"victim":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[CRKillMailVictim class]},
				   @"attackers":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRKillMailAttacker class]},
				   @"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRKillMailItem class], @"elementName":@"victim.items"}};
	return scheme;
}

+ (NSString*) contentType {
	return @"application/vnd.ccp.eve.Killmail-v1+json; charset=utf-8";
}

@end
