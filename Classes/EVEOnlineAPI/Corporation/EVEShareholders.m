//
//  EVEShareholders.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEShareholders.h"

@implementation EVEShareholdersItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"shareholderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shareholderName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"shares":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEShareholdersCharactersItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme) {
		scheme = @{@"shareholderCorporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shareholderCorporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
		
		NSMutableDictionary* dic = [[super scheme] mutableCopy];
		[dic setValuesForKeysWithDictionary:scheme];
		scheme = dic;
	}
	
	return scheme;
}

@end

@implementation EVEShareholders

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characters":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEShareholdersCharactersItem class]},
				   @"corporations":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEShareholdersItem class]}};
	
	return scheme;
}

@end