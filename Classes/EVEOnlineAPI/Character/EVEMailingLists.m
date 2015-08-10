//
//  EVEMailingLists.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMailingLists.h"

@implementation EVEMailingListsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"listID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"displayName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end


@implementation EVEMailingLists
@synthesize mailingListsMap = _mailingListsMap;

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"mailingLists":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMailingListsItem class]}};
	
	return scheme;
}

- (NSDictionary*) mailingListsMap {
	if (!_mailingListsMap) {
		_mailingListsMap = [[NSMutableDictionary alloc] initWithCapacity:self.mailingLists.count];
		for (EVEMailingListsItem* item in self.mailingLists)
			((NSMutableDictionary*)_mailingListsMap)[@(item.listID)] = item;
	}
	return _mailingListsMap;
}

@end
