//
//  EVEOwnerID.m
//  Neocom
//
//  Created by Артем Шиманский on 28.03.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "EVEOwnerID.h"

@implementation EVEOwnerIDItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"ownerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ownerGroupID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end

@implementation EVEOwnerID

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"owners":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEOwnerIDItem class]}};
	
	return scheme;
}

@end