//
//  EVEOutpostServiceDetail.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostServiceDetail.h"


@implementation EVEOutpostServiceDetailItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"serviceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"minStanding":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"surchargePerBadStanding":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"discountPerGoodStanding":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEOutpostServiceDetail

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"outpostServiceDetails":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEOutpostServiceDetailItem class]}};
	
	return scheme;
}

@end