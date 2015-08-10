//
//  EVEJumps.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEJumps.h"


@implementation EVEJumpsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipJumps":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEJumps

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"solarSystems":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEJumpsItem class]}};
	
	return scheme;
}

@end