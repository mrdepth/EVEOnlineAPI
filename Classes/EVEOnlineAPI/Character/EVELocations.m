//
//  EVELocations.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVELocations.h"

@implementation EVELocationsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"itemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"itemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"x":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"y":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"z":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVELocations

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"locations":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVELocationsItem class]}};
	
	return scheme;
}

@end