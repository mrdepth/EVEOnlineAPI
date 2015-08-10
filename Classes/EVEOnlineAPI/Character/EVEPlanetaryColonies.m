//
//  EVEPlanetaryColonies.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryColonies.h"

@implementation EVEPlanetaryColoniesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"planetID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"planetName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"planetTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"planetTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ownerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"lastUpdate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"upgradeLevel":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"numberOfPins":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEPlanetaryColonies

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"colonies":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEPlanetaryColoniesItem class]}};
	
	return scheme;
}

@end