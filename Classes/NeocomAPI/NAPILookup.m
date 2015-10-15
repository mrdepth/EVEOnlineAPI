//
//  NAPILookup.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 19.06.13.
//
//

#import "NAPILookup.h"

@implementation NAPILookup

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"count":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}


@end
