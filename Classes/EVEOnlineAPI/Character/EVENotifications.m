//
//  EVENotifications.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVENotifications.h"

@implementation EVENotificationsItem
@synthesize notificationID;
@synthesize typeID;
@synthesize senderID;
@synthesize sentDate;
@synthesize read;

+ (id) notificationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVENotificationsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[sentDate release];
	[super dealloc];
}

@end


@implementation EVENotifications
@synthesize notifications;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) notificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVENotifications alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) notificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVENotifications alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Notifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Notifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[notifications release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"notifications"]) {
		notifications = [[NSMutableArray alloc] init];
		return notifications;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"notifications"]) {
		EVENotificationsItem *notificationsItem = [EVENotificationsItem notificationsItemWithXMLAttributes:attributeDict];
		[notifications addObject:notificationsItem];
		return notificationsItem;
	}
	return nil;
}

@end