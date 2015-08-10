//
//  EVECharFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharFacWarStats.h"


@implementation EVECharFacWarStats

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"enlisted":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"currentRank":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"highestRank":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsTotal":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsTotal":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end
