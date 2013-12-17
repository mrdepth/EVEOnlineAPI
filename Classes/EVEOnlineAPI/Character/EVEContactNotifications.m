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
		self.notificationID = [[attributeDict valueForKey:@"contactID"] integerValue];
		self.senderID = [[attributeDict valueForKey:@"senderID"] integerValue];
		self.senderName = [attributeDict valueForKey:@"senderName"];

		self.sentDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"sentDate"]];
		
		self.messageData = [attributeDict valueForKey:@"messageData"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.notificationID forKey:@"notificationID"];
	[aCoder encodeInteger:self.senderID forKey:@"senderID"];
	[aCoder encodeObject:self.senderName forKey:@"senderName"];
	[aCoder encodeObject:self.sentDate forKey:@"sentDate"];
	[aCoder encodeObject:self.messageData forKey:@"messageData"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.notificationID = [aDecoder decodeIntegerForKey:@"notificationID"];
		self.senderID = [aDecoder decodeIntegerForKey:@"senderID"];
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

+ (id) contactNotificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContactNotifications alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactNotifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleLong
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
