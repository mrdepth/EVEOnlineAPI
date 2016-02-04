//
//  CRMarketHistory.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 04.02.16.
//
//

#import "CRMarketHistory.h"
#import "NSDateFormatter+EVEOnlineAPI.h"

@implementation CRMarketHistory

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"orderCount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"lowPrice":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"highPrice":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"avgPrice":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"volume":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"date":@{@"type":@(EVEXMLSchemePropertyTypeDate), @"transformer":^(id value) {
					   if ([value isKindOfClass:[NSString class]]) {
						   return [[NSDateFormatter crestMarketDateFormatter] dateFromString:value];
					   }
					   else
						   return (NSDate*) nil;
				   }}};
	
	return scheme;
}

@end

@implementation CRMarketHistoryCollection

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRMarketHistory class]}};
	return scheme;
}

+ (NSString*) contentType {
	return @"application/vnd.ccp.eve.MarketTypeHistoryCollection-v1+json; charset=utf-8";
}

@end