//
//  EVEErrorList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEErrorList.h"


@implementation EVEErrorListItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"errorCode":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"errorText":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end


@implementation EVEErrorList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"errors":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEErrorListItem class]}};
	
	return scheme;
}

@end