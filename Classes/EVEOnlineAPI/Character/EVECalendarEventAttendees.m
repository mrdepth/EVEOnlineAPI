//
//  EVECalendarEventAttendees.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECalendarEventAttendees.h"


@implementation EVECalendarEventAttendeesItem
@synthesize characterID;
@synthesize characterName;
@synthesize response;

+ (id) calendarEventAttendeesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECalendarEventAttendeesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.response = [attributeDict valueForKey:@"response"];
	}
	return self;
}

- (void) dealloc {
	[characterName release];
	[response release];
	[super dealloc];
}

@end


@implementation EVECalendarEventAttendees
@synthesize eventAttendees;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) calendarEventAttendeesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr {
	return [[[EVECalendarEventAttendees alloc] initWithKeyID:keyID vCode:vCode characterID:characterID eventID:eventID error:errorPtr] autorelease];
}

+ (id) calendarEventAttendeesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECalendarEventAttendees alloc] initWithKeyID:keyID vCode:vCode characterID:characterID eventID:eventID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CalendarEventAttendees.xml.aspx?keyID=%d&vCode=%@&characterID=%d&eventID=%d", EVEOnlineAPIHost, keyID, vCode, characterID, eventID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CalendarEventAttendees.xml.aspx?keyID=%d&vCode=%@&characterID=%d&eventID=%d", EVEOnlineAPIHost, keyID, vCode, characterID, eventID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[eventAttendees release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"eventAttendees"]) {
		eventAttendees = [[NSMutableArray alloc] init];
		return eventAttendees;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"eventAttendees"]) {
		EVECalendarEventAttendeesItem *eventAttendeesItem = [EVECalendarEventAttendeesItem calendarEventAttendeesItemWithXMLAttributes:attributeDict];
		[eventAttendees addObject:eventAttendeesItem];
		return eventAttendeesItem;
	}
	return nil;
}

@end