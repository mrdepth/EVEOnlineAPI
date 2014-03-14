//
//  EVEContactNotifications.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContactNotifications.h"

@implementation EVEContactNotificationsItem

+ (id) contactNotificationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEContactNotificationsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.notificationID = [[attributeDict valueForKey:@"contactID"] intValue];
		self.senderID = [[attributeDict valueForKey:@"senderID"] intValue];
		self.senderName = [attributeDict valueForKey:@"senderName"];

		self.sentDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"sentDate"]];
		
		self.messageData = [attributeDict valueForKey:@"messageData"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.notificationID forKey:@"notificationID"];
	[aCoder encodeInt32:self.senderID forKey:@"senderID"];
	[aCoder encodeObject:self.senderName forKey:@"senderName"];
	[aCoder encodeObject:self.sentDate forKey:@"sentDate"];
	[aCoder encodeObject:self.messageData forKey:@"messageData"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.notificationID = [aDecoder decodeInt32ForKey:@"notificationID"];
		self.senderID = [aDecoder decodeInt32ForKey:@"senderID"];
		self.senderName = [aDecoder decodeObjectForKey:@"senderName"];
		self.sentDate = [aDecoder decodeObjectForKey:@"sentDate"];
		self.messageData = [aDecoder decodeObjectForKey:@"messageData"];
	}
	return self;
}

@end

@implementation EVEContactNotifications

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) contactNotificationsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContactNotifications alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactNotifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"contactNotifications"]) {
		self.contactNotifications = [[NSMutableArray alloc] init];
		return self.contactNotifications;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"contactNotifications"]) {
		EVEContactNotificationsItem *contactNotificationsItem = [EVEContactNotificationsItem contactNotificationsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.contactNotifications addObject:contactNotificationsItem];
		return contactNotificationsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.contactNotifications forKey:@"contactNotifications"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.contactNotifications = [aDecoder decodeObjectForKey:@"contactNotifications"];
	}
	return self;
}

@end
