//
//  EVEPlanetaryRoutes.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryRoutes.h"

@implementation EVEPlanetaryRoutesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"routeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"sourcePinID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"destinationPinID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contentTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contentTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"waypoint1":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"waypoint2":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"waypoint3":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"waypoint4":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"waypoint5":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEPlanetaryRoutes

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"routes":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEPlanetaryRoutesItem class]}};
	
	return scheme;
}

@end