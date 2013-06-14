//
//  EVEUpcomingCalendarEvents.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEUpcomingCalendarEvents.h"


@implementation EVEUpcomingCalendarEventsItem

+ (id) upcomingCalendarEventsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEUpcomingCalendarEventsItem alloc] initWithXMLAttributes:attributeDict];
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

@end


@implementation EVEUpcomingCalendarEvents

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) upcomingCalendarEventsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEUpcomingCalendarEvents alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/UpcomingCalendarEvents.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"upcomingEvents"]) {
		self.upcomingCalendarEvents = [[NSMutableArray alloc] init];
		return self.upcomingCalendarEvents;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"upcomingEvents"]) {
		EVEUpcomingCalendarEventsItem *upcomingCalendarEventsItem = [EVEUpcomingCalendarEventsItem upcomingCalendarEventsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.upcomingCalendarEvents addObject:upcomingCalendarEventsItem];
		return upcomingCalendarEventsItem;
	}
	return nil;
}

@end