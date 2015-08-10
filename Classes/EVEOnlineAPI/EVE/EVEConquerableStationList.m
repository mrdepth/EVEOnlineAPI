//
//  EVEConquerableStationList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEConquerableStationList.h"


@implementation EVEConquerableStationListItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"stationTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"x":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"y":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"z":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEConquerableStationList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"outposts":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEConquerableStationListItem class]}};
	
	return scheme;
}

@end