//
//  EVEContactList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContactList.h"

@implementation EVEContactListContact

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"contactID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contactName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"standing":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contactTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"labelMask":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"inWatchlist":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation EVEContactListLabel

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"labelID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVEContactList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"contactList":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactListContact class]},
				   @"contactLabels":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactListLabel class]},
				   @"corporateContactList":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactListContact class]},
				   @"corporateContactLabels":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactListLabel class]},
				   @"allianceContactList":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactListContact class]},
				   @"allianceContactLabels":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactListLabel class]}};
	
	return scheme;
}

@end
