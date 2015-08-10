//
//  EVECharacters.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacters.h"

@implementation EVECharactersItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"name"},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end


@implementation EVECharacters

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characters":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharactersItem class]}};
	return scheme;
}


@end
