//
//  EVEContactNotifications.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContactNotifications.h"

@implementation EVEContactNotificationsItem
@synthesize notificationID;
@synthesize senderID;
@synthesize senderName;
@synthesize sentDate;
@synthesize messageData;

+ (id) contactNotificationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEContactNotificationsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[senderName release];
	[sentDate release];
	[messageData release];
	[super dealloc];
}

@end

@implementation EVEContactNotifications
@synthesize contactNotifications;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) contactNotificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEContactNotifications alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) contactNotificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEContactNotifications alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactNotifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactNotifications.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[contactNotifications release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"contactNotifications"]) {
		contactNotifications = [[NSMutableArray alloc] init];
		return contactNotifications;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"contactNotifications"]) {
		EVEContactNotificationsItem *contactNotificationsItem = [EVEContactNotificationsItem contactNotificationsItemWithXMLAttributes:attributeDict];
		[contactNotifications addObject:contactNotificationsItem];
		return contactNotificationsItem;
	}
	return nil;
}

@end
