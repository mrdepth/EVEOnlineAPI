//
//  EVEMailBodies.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEMailBodies.h"


@implementation EVEMailBodiesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"messageID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"text":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"_"}};
	return scheme;
}

@end


@implementation EVEMailBodies

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"messages":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMailBodiesItem class]},
				   @"missingMessageIDs":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[NSArray class], @"transformer":^(id value) {
					   if ([value length] == 0)
						   return (id) nil;
					   else
						   return [[value componentsSeparatedByString:@""] valueForKey:@"intValue"];
				   }}};
	
	return scheme;
}

@end
