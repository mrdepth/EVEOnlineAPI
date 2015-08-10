//
//  EVEMemberMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberMedals.h"


@implementation EVEMemberMedalsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"medalID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"reason":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"status":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"issuerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"issued":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}

@end


@implementation EVEMemberMedals

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"issuedMedals":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberMedalsItem class]}};
	
	return scheme;
}

@end