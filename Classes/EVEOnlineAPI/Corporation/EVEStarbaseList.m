//
//  EVEStarbaseList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStarbaseList.h"


@implementation EVEStarbaseListItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"itemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"locationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"moonID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"state":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stateTimestamp":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"onlineTimestamp":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"standingOwnerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEStarbaseList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"starbases":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEStarbaseListItem class]}};
	
	return scheme;
}

@end