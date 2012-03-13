//
//  EVENotificationTexts.m
//  EVEUniverse
//
//  Created by Mr. Depth on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVENotificationTexts.h"


@implementation EVENotificationTextsItem
@synthesize notificationID;
@synthesize properties;

+ (id) notificationsTextItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVENotificationTextsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.notificationID = [[attributeDict valueForKey:@"notificationID"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[properties release];
	[super dealloc];
}

@end


@implementation EVENotificationTexts
@synthesize notifications;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) notificationTextsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr {
	return [[[EVENotificationTexts alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids error:errorPtr] autorelease];
}

+ (id) notificationTextsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)object {
	return [[[EVENotificationTexts alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/NotificationTexts.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@", EVEOnlineAPIHost, keyID, vCode, characterID, [ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/NotificationTexts.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@", EVEOnlineAPIHost, keyID, vCode, characterID, [ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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
		EVENotificationTextsItem *notificationsTextItem = [EVENotificationTextsItem notificationsTextItemWithXMLAttributes:attributeDict];
		[notifications addObject:notificationsTextItem];
		return notificationsTextItem;
	}
	return nil;
}

- (void) didEndRow: (id) row rowset: (NSString*) rowset {
	[super didEndRow:row rowset:rowset];
	if ([rowset isEqualToString:@"notifications"]) {
		NSArray* components = [text componentsSeparatedByString:@"\n"];
		NSMutableDictionary* properties = [NSMutableDictionary dictionary];
		for (NSString* component in components) {
			NSRange separator = [component rangeOfString:@":"];
			if (separator.location != NSNotFound) {
				NSString* key = [component substringToIndex:separator.location];
				NSString* s = [component substringFromIndex:separator.location + 1];
				NSMutableString* value = [NSMutableString stringWithString:s ? s : @""];
				[value replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0, 1)];
				[value replaceOccurrencesOfString:@"\"" withString:@"" options:0 range:NSMakeRange(0, 1)];
				[value replaceOccurrencesOfString:@"\"" withString:@"" options:0 range:NSMakeRange(value.length - 1, 1)];
				[properties setValue:value forKey:key];
			}
		}
		[row setProperties:properties];
	}
}

@end
