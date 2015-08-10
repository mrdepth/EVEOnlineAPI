//
//  EVECharStandings.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharStandings.h"

@implementation EVEStandingsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"fromID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"fromName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"standing":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}

@end


@implementation EVEStandingsNPCStandings

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"agents":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEStandingsItem class]},
				   @"npcCorporations":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEStandingsItem class], @"elementName": @"NPCCorporations"},
				   @"factions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEStandingsItem class]}};
	
	return scheme;
}

@end

@implementation EVECharStandings

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterNPCStandings":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEStandingsNPCStandings class]}};
	
	return scheme;
}

@end