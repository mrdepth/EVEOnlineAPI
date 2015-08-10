//
//  EVERefTypes.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVERefTypes.h"


@implementation EVERefTypesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"refTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"refTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end


@implementation EVERefTypes

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"refTypes":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVERefTypesItem class]}};
	
	return scheme;
}

@end