//
//  EVEKills.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEKills.h"


@implementation EVEKillsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipKills":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionKills":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"podKills":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEKills

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystems":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEKillsItem class]}};
	
	return scheme;
}

@end