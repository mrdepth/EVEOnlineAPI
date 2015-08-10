//
//  EVECharWalletTransactions.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharWalletTransactions.h"


@implementation EVEWalletTransactionsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"transactionDateTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"transactionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"price":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"clientID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"clientName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"transactionType":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"transactionFor":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"journalTransactionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"clientTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVECharWalletTransactions

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"transactions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEWalletTransactionsItem class]}};
	
	return scheme;
}

@end