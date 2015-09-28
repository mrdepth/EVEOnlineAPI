//
//  EVECentralMarketStat.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralMarketStat.h"

@implementation EVECentralMarketStatTypeStat

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"volume":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"avg":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"max":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"min":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stddev":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"median":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"percentile":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation EVECentralMarketStatType


+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"id"},
				   @"all":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVECentralMarketStatTypeStat class]},
				   @"buy":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVECentralMarketStatTypeStat class]},
				   @"sell":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVECentralMarketStatTypeStat class]}};
	return scheme;
}

@end



@implementation EVECentralMarketStat

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"type":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVECentralMarketStatType class]}};
	return scheme;
}

@end
