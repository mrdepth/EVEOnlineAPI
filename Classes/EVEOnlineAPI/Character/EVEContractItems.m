//
//  EVEContractItems.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContractItems.h"


@implementation EVEContractItemsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"recordID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"rawQuantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"singleton":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"included":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVEContractItems

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"itemList":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContractItemsItem class]}};
	
	return scheme;
}

@end