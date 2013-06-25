//
//  EVECalendarEventAttendees.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECalendarEventAttendees.h"


@implementation EVECalendarEventAttendeesItem

+ (id) calendarEventAttendeesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECalendarEventAttendeesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.response = [attributeDict valueForKey:@"response"];
	}
	return self;
}

@end


@implementation EVECalendarEventAttendees

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) calendarEventAttendeesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECalendarEventAttendees alloc] initWithKeyID:keyID vCode:vCode characterID:characterID eventID:eventID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr progressHandler:(void (^)(CGFloat))progressHandler{
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CalendarEventAttendees.xml.aspx?keyID=%d&vCode=%@&characterID=%d&eventID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, eventID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"eventAttendees"]) {
		self.eventAttendees = [[NSMutableArray alloc] init];
		return self.eventAttendees;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"eventAttendees"]) {
		EVECalendarEventAttendeesItem *eventAttendeesItem = [EVECalendarEventAttendeesItem calendarEventAttendeesItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.eventAttendees addObject:eventAttendeesItem];
		return eventAttendeesItem;
	}
	return nil;
}

@end