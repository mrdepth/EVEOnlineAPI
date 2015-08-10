//
//  EVEFacWarTopStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarTopStats.h"

@implementation EVEFacWarTopStatsCharactersItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"againstID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"againstName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end


@implementation EVEFacWarTopStatsCorporationsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"againstID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"againstName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}


@end


@implementation EVEFacWarTopStatsFactionsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"againstID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"againstName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVEFacWarTopStatsItem
@end

@implementation EVEFacWarTopStatsCharacters

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"killsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCharactersItem class]},
				   @"killsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCharactersItem class]},
				   @"killsTotal":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCharactersItem class]},
				   @"victoryPointsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCharactersItem class]},
				   @"victoryPointsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCharactersItem class]},
				   @"victoryPointsTotal":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCharactersItem class]}};
	return scheme;
}

@end

@implementation EVEFacWarTopStatsCorporations

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"killsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCorporationsItem class]},
				   @"killsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCorporationsItem class]},
				   @"killsTotal":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCorporationsItem class]},
				   @"victoryPointsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCorporationsItem class]},
				   @"victoryPointsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCorporationsItem class]},
				   @"victoryPointsTotal":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsCorporationsItem class]}};
	return scheme;
}

@end


@implementation EVEFacWarTopStatsFactions

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"killsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsFactionsItem class]},
				   @"killsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsFactionsItem class]},
				   @"killsTotal":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsFactionsItem class]},
				   @"victoryPointsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsFactionsItem class]},
				   @"victoryPointsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsFactionsItem class]},
				   @"victoryPointsTotal":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarTopStatsFactionsItem class]}};
	return scheme;
}

@end

@implementation EVEFacWarTopStats

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characters":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEFacWarTopStatsCharacters class]},
				   @"corporations":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEFacWarTopStatsCorporations class]},
				   @"factions":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEFacWarTopStatsFactions class]}};
	return scheme;
}

@end