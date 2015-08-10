//
//  EVECharacterID.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterID.h"


@implementation EVECharacterIDItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end

@implementation EVECharacterID

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characters":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterIDItem class]}};
	
	return scheme;
}

@end