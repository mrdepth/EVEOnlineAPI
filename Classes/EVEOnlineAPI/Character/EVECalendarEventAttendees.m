//
//  EVECalendarEventAttendees.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECalendarEventAttendees.h"


@implementation EVECalendarEventAttendeesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"response":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}
@end


@implementation EVECalendarEventAttendees

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"eventAttendees":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECalendarEventAttendeesItem class]}};
	return scheme;
}

@end