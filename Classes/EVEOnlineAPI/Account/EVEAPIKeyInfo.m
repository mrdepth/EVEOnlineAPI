//
//  EVEAPIKeyInfo.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEAPIKeyInfo.h"


@implementation EVEAPIKeyInfoCharactersItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end


@implementation EVEAPIKeyInfoKey

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"accessMask":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"type":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
					   NSString* string = value;
					   return @([string isEqualToString:@"Corporation"] ? EVEAPIKeyTypeCorporation : ([string isEqualToString:@"Character"] ? EVEAPIKeyTypeCharacter : EVEAPIKeyTypeAccount));
				   }},
				   @"expires":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"characters":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAPIKeyInfoCharactersItem class]}};
	return scheme;
}

@end


@implementation EVEAPIKeyInfo

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"key":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEAPIKeyInfoKey class]}};
	return scheme;
}

@end