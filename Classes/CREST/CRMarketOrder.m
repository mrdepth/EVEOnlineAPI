//
//  CRMarketOrder.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 24.12.15.
//
//

#import "CRMarketOrder.h"
#import "NSDateFormatter+EVEOnlineAPI.h"

@implementation CRMarketOrder

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"orderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"id"},
				   @"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"location.id"},
				   @"volEntered":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"volumeEntered"},
				   @"volRemaining":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"volume"},
				   @"minVolume":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"type.id"},
				   @"range":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
					   if ([value isKindOfClass:[NSString class]]) {
						   if ([value isEqualToString:@"station"])
							   return @(-1);
						   else if ([value isEqualToString:@"solarsystem"])
							   return @0;
						   else if ([value isEqualToString:@"region"])
							   return @32767;
						   else
							   return @([value integerValue]);
						   
					   }
					   else if ([value isKindOfClass:[NSNumber class]])
						   return (NSNumber*) value;
					   else
						   return @(-1);
				   }},
				   @"duration":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"price":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"bid":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"buy"},
				   @"issued":@{@"type":@(EVEXMLSchemePropertyTypeDate), @"transformer":^(id value) {
					   if ([value isKindOfClass:[NSString class]]) {
						   return [[NSDateFormatter crestMarketDateFormatter] dateFromString:value];
					   }
					   else
						   return (NSDate*) nil;
				   }}};
	
	return scheme;
}

@end

@implementation CRMarketOrderCollection

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRMarketOrder class]}};
	return scheme;
}

+ (NSString*) contentType {
	return @"application/vnd.ccp.eve.MarketOrderCollection-v1+json; charset=utf-8";
}

@end
