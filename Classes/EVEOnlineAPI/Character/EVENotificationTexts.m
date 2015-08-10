//
//  EVENotificationTexts.m
//  EVEUniverse
//
//  Created by Mr. Depth on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVENotificationTexts.h"


@implementation EVENotificationTextsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"notificationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"properties":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[NSDictionary class], @"elementName":@"_", @"transformer":^(id value) {
					   NSArray* components = [value componentsSeparatedByString:@"\n"];
					   NSMutableDictionary* properties = [NSMutableDictionary new];
					   for (NSString* component in components) {
						   NSRange separator = [component rangeOfString:@":"];
						   if (separator.location != NSNotFound) {
							   NSString* key = [component substringToIndex:separator.location];
							   NSString* s = [component substringFromIndex:separator.location + 1];
							   NSMutableString* value = [NSMutableString stringWithString:s ? s : @""];
							   if (key && value) {
								   [value replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0, 1)];
								   [value replaceOccurrencesOfString:@"\"" withString:@"" options:0 range:NSMakeRange(0, 1)];
								   [value replaceOccurrencesOfString:@"\"" withString:@"" options:0 range:NSMakeRange(value.length - 1, 1)];
								   properties[key] = value;
							   }
						   }
					   }
					   return properties;
				   }},
				   @"senderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"sentDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"read":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVENotificationTexts

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"notifications":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVENotificationTextsItem class]}};
	
	return scheme;
}

@end
