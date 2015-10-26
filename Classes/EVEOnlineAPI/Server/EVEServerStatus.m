//
//  EVEServerStatus.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEServerStatus.h"


@implementation EVEServerStatus

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"serverOpen":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
			if ([value isKindOfClass:[NSString class]])
				return @([value boolValue]);
			else
				return @(NO);
		}},
				   @"onlinePlayers":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end