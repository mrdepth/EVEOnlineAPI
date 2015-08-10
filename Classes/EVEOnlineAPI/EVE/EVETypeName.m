//
//  EVETypeName.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.08.15.
//
//

#import "EVETypeName.h"

@implementation EVETypeNameItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end

@implementation EVETypeName

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"types":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETypeNameItem class]}};
	
	return scheme;
}


@end
