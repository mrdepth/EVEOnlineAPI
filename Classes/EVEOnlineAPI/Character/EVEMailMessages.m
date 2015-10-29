//
//  EVEMailMessages.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMailMessages.h"


@implementation EVEMailMessagesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	id (^transformer)(id) = ^(id value) {
		if ([value isKindOfClass:[NSString class]]) {
			if ([value length] == 0)
			return (id) nil;
			else
			return [[value componentsSeparatedByString:@""] valueForKey:@"intValue"];
		}
		else
			return (id) @[];
	};
	
	if (!scheme)
		scheme = @{@"messageID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"sentDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"title":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"toCorpOrAllianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"toCharacterIDs":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[NSArray class], @"transformer":transformer},
				   @"toListID":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[NSArray class], @"transformer":transformer},
				   @"senderTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEMailMessages

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"messages":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMailMessagesItem class]}};
	
	return scheme;
}

@end