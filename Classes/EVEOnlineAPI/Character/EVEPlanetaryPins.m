//
//  EVEPlanetaryPins.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryPins.h"

@implementation EVEPlanetaryPinsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"pinID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"schematicID":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"lastLaunchTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"cycleTime":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"quantityPerCycle":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"installTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"expiryTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"contentTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contentTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"contentQuantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"longitude":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"latitude":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEPlanetaryPins

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"pins":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEPlanetaryPinsItem class]}};
	
	return scheme;
}

@end