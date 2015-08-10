//
//  EVEContractBids.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContractBids.h"


@implementation EVEContractBidsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"bidID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contractID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"bidderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"dateBid":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"amount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVEContractBids

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"bidList":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContractBidsItem class]}};
	
	return scheme;
}

@end