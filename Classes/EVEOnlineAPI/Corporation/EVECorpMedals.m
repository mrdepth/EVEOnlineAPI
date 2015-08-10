//
//  EVECorpMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpMedals.h"


@implementation EVECorpMedalsItem
@synthesize description = _description;

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"medalID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"title":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"medalDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"},
				   @"creatorID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"created":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}

@end


@implementation EVECorpMedals

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"medals":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECorpMedalsItem class]}};
	
	return scheme;
}

@end