//
//  EVEMarketOrders.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMarketOrders.h"


@implementation EVEMarketOrdersItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"orderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"charID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"volEntered":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"volRemaining":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"minVolume":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"orderState":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"range":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"accountKey":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"duration":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"escrow":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"price":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"bid":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"issued":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}

@end


@implementation EVEMarketOrders

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"orders":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMarketOrdersItem class]}};
	
	return scheme;
}

@end
