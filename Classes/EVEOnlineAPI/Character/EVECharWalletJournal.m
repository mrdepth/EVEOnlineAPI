//
//  EVECharWalletJournal.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharWalletJournal.h"

@implementation EVECharWalletJournalItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme) {
		scheme = @{@"taxReceiverID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxAmount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
		
		NSMutableDictionary* dic = [[super scheme] mutableCopy];
		[dic setValuesForKeysWithDictionary:scheme];
		scheme = dic;
	}
	
	return scheme;
}

@end


@implementation EVECharWalletJournal

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"transactions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharWalletJournalItem class]}};
	
	return scheme;
}

@end