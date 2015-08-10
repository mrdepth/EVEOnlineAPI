//
//  EVECorpWalletJournal.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpWalletJournal.h"


@implementation EVEWalletJournalItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"date":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"refID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"refTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerName1":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ownerID1":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerName2":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ownerID2":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"argName1":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"argID1":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"amount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"balance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"reason":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"owner1TypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"owner2TypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVECorpWalletJournal

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"entries":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEWalletJournalItem class]}};
	
	return scheme;
}

@end