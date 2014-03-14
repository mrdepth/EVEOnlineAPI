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
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.response = [attributeDict valueForKey:@"response"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeObject:self.response forKey:@"response"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.response = [aDecoder decodeObjectForKey:@"response"];
	}
	return self;
}

@end


@implementation EVECalendarEventAttendees

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) calendarEventAttendeesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID eventID: (int32_t) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECalendarEventAttendees alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID eventID:eventID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID eventID: (int32_t) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler{
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CalendarEventAttendees.xml.aspx?keyID=%d&vCode=%@&characterID=%d&eventID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, eventID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.eventAttendees forKey:@"eventAttendees"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.eventAttendees = [aDecoder decodeObjectForKey:@"eventAttendees"];
	}
	return self;
}

@end