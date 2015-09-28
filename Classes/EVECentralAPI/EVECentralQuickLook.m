//
//  EVECentralQuickLook.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralQuickLook.h"

@implementation EVECentralQuickLookOrder

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"orderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"id"},
				   @"regionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"region"},
				   @"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"station"},
				   @"stationName":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"station_name"},
				   @"security":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"range":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"price":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"volRemain":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"vol_remain"},
				   @"minVolume":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"min_volume"},
				   @"expires":@{@"type":@(EVEXMLSchemePropertyTypeObject),  @"transformer":^(id value) {
					   static NSDateFormatter* dateFormatter;
					   if (!dateFormatter) {
						   static dispatch_once_t onceToken;
						   dispatch_once(&onceToken, ^{
							   dateFormatter = [NSDateFormatter new];
							   [dateFormatter setDateFormat:@"yyyy-MM-dd"];
							   [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
							   [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
						   });
					   }
					   return [dateFormatter dateFromString:value];
				   }},
				   @"reportedTime":@{@"type":@(EVEXMLSchemePropertyTypeObject),@"transformer":^(id value) {
					   static NSDateFormatter* dateFormatter;
					   if (!dateFormatter) {
						   static dispatch_once_t onceToken;
						   dispatch_once(&onceToken, ^{
							   dateFormatter = [NSDateFormatter new];
							   [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
							   [dateFormatter setDefaultDate:[NSDate date]];
							   [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
							   [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
						   });
					   }
					   return [dateFormatter dateFromString:value];
				   }, @"elementName":@"reported_time"}
				   
				   };
	return scheme;
}

@end


@implementation EVECentralQuickLook

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"item"},
				   @"hours":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"item"},
				   @"minQ":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"minqty"},
				   @"buyOrders":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[EVECentralQuickLookOrder class],  @"transformer":^(id value) {
					   return value[@"order"];
				   }, @"elementName":@"sell_orders"},
				   @"sellOrders":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[EVECentralQuickLookOrder class],  @"transformer":^(id value) {
					   return value[@"order"];
				   }, @"elementName":@"buy_orders"}
		};
	return scheme;
}

@end