//
//  EVECharacterAffiliation.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.08.15.
//
//

#import "EVECharacterAffiliation.h"

@implementation EVECharacterAffiliation

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characters":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEAPIKeyInfoCharactersItem class]}};
	return scheme;
}

@end
