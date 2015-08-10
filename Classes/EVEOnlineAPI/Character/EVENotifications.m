//
//  EVENotifications.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVENotifications.h"

@implementation EVENotificationsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"notificationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"sentDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"read":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}


@end


@implementation EVENotifications

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"notifications":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVENotificationsItem class]}};
	
	return scheme;
}

@end