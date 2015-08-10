//
//  EVEOutpostList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostList.h"


@implementation EVEOutpostListItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"dockingCostPerShipVolume":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"officeRentalCost":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"reprocessingEfficiency":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"reprocessingStationTake":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"standingOwnerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"x":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"y":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"z":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEOutpostList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"corporationStarbases":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEOutpostListItem class]}};
	
	return scheme;
}

@end