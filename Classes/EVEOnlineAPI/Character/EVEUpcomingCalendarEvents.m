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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.eventID forKey:@"eventID"];
	[aCoder encodeInteger:self.ownerID forKey:@"ownerID"];

	[aCoder encodeObject:self.ownerName forKey:@"ownerName"];
	[aCoder encodeObject:self.eventDate forKey:@"eventDate"];
	[aCoder encodeObject:self.eventTitle forKey:@"eventTitle"];
	
	[aCoder encodeInteger:self.duration forKey:@"duration"];
	[aCoder encodeInteger:self.importance forKey:@"importance"];

	[aCoder encodeObject:self.response forKey:@"response"];
	[aCoder encodeObject:self.eventText forKey:@"eventText"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.eventID = [aDecoder decodeIntegerForKey:@"eventID"];
		self.ownerID = [aDecoder decodeIntegerForKey:@"ownerID"];
		
		self.ownerName = [aDecoder decodeObjectForKey:@"ownerName"];
		self.eventDate = [aDecoder decodeObjectForKey:@"eventDate"];
		self.eventTitle = [aDecoder decodeObjectForKey:@"eventTitle"];
		
		self.duration = [aDecoder decodeIntegerForKey:@"duration"];
		self.importance = [aDecoder decodeIntegerForKey:@"importance"];

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

+ (id) upcomingCalendarEventsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEUpcomingCalendarEvents alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
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