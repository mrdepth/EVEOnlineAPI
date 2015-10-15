//
//  NAPIUpload.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "NAPIUpload.h"
#import "NeocomAPI.h"

@implementation NAPIUpload

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"success":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"status", @"transformer":^(id value) {
			if ([value isKindOfClass:[NSString class]] && [value isEqualToString:@"ok"])
				return @(YES);
			else
				return @(NO);
		}}};
	return scheme;
}

@end
