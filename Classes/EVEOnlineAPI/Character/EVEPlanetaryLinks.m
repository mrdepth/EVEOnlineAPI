//
//  EVEPlanetaryLinks.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryLinks.h"

@implementation EVEPlanetaryLinksItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"sourcePinID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"destinationPinID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"linkLevel":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEPlanetaryLinks

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"links":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEPlanetaryLinksItem class]}};
	
	return scheme;
}

@end