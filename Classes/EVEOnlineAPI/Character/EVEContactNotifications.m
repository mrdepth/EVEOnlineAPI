//
//  EVEContactNotifications.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContactNotifications.h"

@implementation EVEContactNotificationsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"notificationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"senderName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"sentDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"messageData":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVEContactNotifications

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"contactNotifications":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContactNotificationsItem class]}};
	
	return scheme;
}

@end
