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
		self.eventID = [[attributeDict valueForKey:@"eventID"] intValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] intValue];
		self.ownerName = [attributeDict valueForKey:@"ownerName"];
		self.eventDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"eventDate"]];
		self.eventTitle = [attributeDict valueForKey:@"eventTitle"];
		self.duration = [[attributeDict valueForKey:@"duration"] intValue];
		self.importance = [[attributeDict valueForKey:@"importance"] intValue];
		self.response = [attributeDict valueForKey:@"response"];
		self.eventText = [attributeDict valueForKey:@"eventText"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.eventID forKey:@"eventID"];
	[aCoder encodeInt32:self.ownerID forKey:@"ownerID"];

	[aCoder encodeObject:self.ownerName forKey:@"ownerName"];
	[aCoder encodeObject:self.eventDate forKey:@"eventDate"];
	[aCoder encodeObject:self.eventTitle forKey:@"eventTitle"];
	
	[aCoder encodeInt32:self.duration forKey:@"duration"];
	[aCoder encodeInt32:self.importance forKey:@"importance"];

	[aCoder encodeObject:self.response forKey:@"response"];
	[aCoder encodeObject:self.eventText forKey:@"eventText"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.eventID = [aDecoder decodeInt32ForKey:@"eventID"];
		self.ownerID = [aDecoder decodeInt32ForKey:@"ownerID"];
		
		self.ownerName = [aDecoder decodeObjectForKey:@"ownerName"];
		self.eventDate = [aDecoder decodeObjectForKey:@"eventDate"];
		self.eventTitle = [aDecoder decodeObjectForKey:@"eventTitle"];
		
		self.duration = [aDecoder decodeInt32ForKey:@"duration"];
		self.importance = [aDecoder decodeInt32ForKey:@"importance"];

		self.response = [aDecoder decodeObjectForKey:@"response"];
		self.eventText = [aDecoder decodeObjectForKey:@"eventText"];
	}
	return self;
}

@end


@implementation EVEUpcomingCalendarEvents

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) upcomingCalendarEventsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEUpcomingCalendarEvents alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/UpcomingCalendarEvents.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.upcomingCalendarEvents forKey:@"upcomingCalendarEvents"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.upcomingCalendarEvents = [aDecoder decodeObjectForKey:@"upcomingCalendarEvents"];
	}
	return self;
}

@end