//
//  EVESovereignty.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESovereignty.h"


@implementation EVESovereigntyItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVESovereignty

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystems":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVESovereigntyItem class]}};
	
	return scheme;
}

@end