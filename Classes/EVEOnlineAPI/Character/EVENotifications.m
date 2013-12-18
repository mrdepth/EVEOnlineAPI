//
//  EVENotifications.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVENotifications.h"

@implementation EVENotificationsItem

+ (id) notificationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVENotificationsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.notificationID = [[attributeDict valueForKey:@"notificationID"] integerValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.senderID = [[attributeDict valueForKey:@"senderID"] integerValue];
		self.sentDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"sentDate"]];
		self.read = [[attributeDict valueForKey:@"read"] boolValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.notificationID forKey:@"notificationID"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeInteger:self.senderID forKey:@"senderID"];
	[aCoder encodeObject:self.sentDate forKey:@"sentDate"];
	[aCoder encodeBool:self.read forKey:@"read"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.notificationID = [aDecoder decodeIntegerForKey:@"notificationID"];
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.senderID = [aDecoder decodeIntegerForKey:@"senderID"];
		self.sentDate = [aDecoder decodeObjectForKey:@"sentDate"];
		self.read = [aDecoder decodeBoolForKey:@"read"];
	}
	return self;
}

@end


@implementation EVENotifications

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) notificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVENotifications alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Notifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"notifications"]) {
		self.notifications = [[NSMutableArray alloc] init];
		return self.notifications;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"notifications"]) {
		EVENotificationsItem *notificationsItem = [EVENotificationsItem notificationsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.notifications addObject:notificationsItem];
		return notificationsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.notifications forKey:@"notifications"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.notifications = [aDecoder decodeObjectForKey:@"notifications"];
	}
	return self;
}

@end