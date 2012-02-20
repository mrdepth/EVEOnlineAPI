//
//  EVEUpcomingCalendarEvents.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEUpcomingCalendarEvents.h"


@implementation EVEUpcomingCalendarEventsItem
@synthesize eventID;
@synthesize ownerID;
@synthesize ownerName;
@synthesize eventDate;
@synthesize eventTitle;
@synthesize duration;
@synthesize importance;
@synthesize response;
@synthesize eventText;

+ (id) upcomingCalendarEventsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEUpcomingCalendarEventsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.eventID = [[attributeDict valueForKey:@"eventID"] integerValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] integerValue];
		self.ownerName = [attributeDict valueForKey:@"ownerName"];
		self.eventDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"eventDate"]];
		self.eventTitle = [attributeDict valueForKey:@"eventTitle"];
		self.duration = [[attributeDict valueForKey:@"duration"] integerValue];
		self.importance = [[attributeDict valueForKey:@"importance"] integerValue];
		self.response = [attributeDict valueForKey:@"response"];
		self.eventText = [attributeDict valueForKey:@"eventText"];
	}
	return self;
}

- (void) dealloc {
	[ownerName release];
	[eventDate release];
	[eventTitle release];
	[response release];
	[eventText release];
	[super dealloc];
}

@end


@implementation EVEUpcomingCalendarEvents
@synthesize upcomingCalendarEvents;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) upcomingCalendarEventsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEUpcomingCalendarEvents alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) upcomingCalendarEventsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEUpcomingCalendarEvents alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/UpcomingCalendarEvents.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/UpcomingCalendarEvents.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[upcomingCalendarEvents release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"upcomingEvents"]) {
		upcomingCalendarEvents = [[NSMutableArray alloc] init];
		return upcomingCalendarEvents;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"upcomingEvents"]) {
		EVEUpcomingCalendarEventsItem *upcomingCalendarEventsItem = [EVEUpcomingCalendarEventsItem upcomingCalendarEventsItemWithXMLAttributes:attributeDict];
		[upcomingCalendarEvents addObject:upcomingCalendarEventsItem];
		return upcomingCalendarEventsItem;
	}
	return nil;
}

@end