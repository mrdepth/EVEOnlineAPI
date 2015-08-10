//
//  EVECorpFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpFacWarStats.h"


@implementation EVECorpFacWarStats

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"enlisted":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"pilots":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"killsTotal":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsYesterday":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsLastWeek":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointsTotal":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end
