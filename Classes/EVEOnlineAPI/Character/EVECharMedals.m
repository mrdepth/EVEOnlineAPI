//
//  EVECharMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharMedals.h"

@implementation EVECharMedal

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"medalID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"reason":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"status":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"issuerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"issued":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}


@end


@implementation EVECharOtherCorporationsMedal

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme) {
		scheme = @{@"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"title":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"medalDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"}};
		
		NSMutableDictionary* dic = [[super scheme] mutableCopy];
		[dic setValuesForKeysWithDictionary:scheme];
		scheme = dic;
	}
	
	return scheme;
}

@end


@implementation EVECharMedals

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"currentCorporation":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharMedal class]},
				   @"otherCorporations":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharOtherCorporationsMedal class]}};
	
	return scheme;
}

@end