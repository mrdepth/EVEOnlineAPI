//
//  EVEFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarStats.h"

@implementation EVEFacWarStatsKills

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"killsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsTotal":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsTotal":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVEFacWarStatsFactionsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme) {
		scheme = @{@"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"pilots":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"systemsControlled":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
		
		NSMutableDictionary* dic = [[super scheme] mutableCopy];
		[dic setValuesForKeysWithDictionary:scheme];
		scheme = dic;
	}
	
	return scheme;
}

@end


@implementation EVEFacWarStatsFactionWarsItem

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


@implementation EVEFacWarStats

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"totals":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEFacWarStatsKills class]},
				   @"factions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarStatsFactionsItem class]},
				   @"factionWars":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarStatsFactionWarsItem class]}};
	return scheme;
}

@end