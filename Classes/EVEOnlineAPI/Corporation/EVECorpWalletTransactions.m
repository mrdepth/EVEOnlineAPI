//
//  EVECorpWalletTransactions.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpWalletTransactions.h"


@implementation EVECorpWalletTransactionsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme) {
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
		NSMutableDictionary* dic = [[super scheme] mutableCopy];
		[dic setValuesForKeysWithDictionary:scheme];
		scheme = dic;
	}
	
	return scheme;
}

@end


@implementation EVECorpWalletTransactions

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"transactions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECorpWalletTransactionsItem class]}};
	
	return scheme;
}

@end