//
//  EVEUpcomingCalendarEvents.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEUpcomingCalendarEvents.h"


@implementation EVEUpcomingCalendarEventsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"eventID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ownerName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"eventDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"eventTitle":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"duration":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"importance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"response":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"eventText":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end


@implementation EVEUpcomingCalendarEvents

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"upcomingEvents":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEUpcomingCalendarEventsItem class]}};
	
	return scheme;
}

@end