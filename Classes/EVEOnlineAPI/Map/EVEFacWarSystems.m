//
//  EVEFacWarSystems.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarSystems.h"


@implementation EVEFacWarSystemsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"occupyingFactionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"occupyingFactionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"owningFactionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"owningFactionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"contested":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPoints":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"victoryPointThreshold":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEFacWarSystems

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystems":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacWarSystemsItem class]}};
	
	return scheme;
}

@end