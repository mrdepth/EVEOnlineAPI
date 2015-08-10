//
//  EVEAccountBalance.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAccountBalance.h"

@implementation EVEAccountBalanceItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"accountID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"accountKey":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"balance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVEAccountBalance

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"accounts":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAccountBalanceItem class]}};
	return scheme;
}

@end
