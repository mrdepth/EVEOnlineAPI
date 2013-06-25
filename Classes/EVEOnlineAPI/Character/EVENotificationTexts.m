//
//  EVENotificationTexts.m
//  EVEUniverse
//
//  Created by Mr. Depth on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVENotificationTexts.h"


@implementation EVENotificationTextsItem

+ (id) notificationsTextItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVENotificationTextsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.notificationID = [[attributeDict valueForKey:@"notificationID"] integerValue];
	}
	return self;
}

@end


@implementation EVENotificationTexts

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) notificationTextsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVENotificationTexts alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/NotificationTexts.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, [ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

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
		EVENotificationTextsItem *notificationsTextItem = [EVENotificationTextsItem notificationsTextItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.notifications addObject:notificationsTextItem];
		return notificationsTextItem;
	}
	return nil;
}

- (void) didEndRow: (id) row rowset: (NSString*) rowset {
	[super didEndRow:row rowset:rowset];
	if ([rowset isEqualToString:@"notifications"]) {
		NSArray* components = [self.text componentsSeparatedByString:@"\n"];
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
		[(EVENotificationTextsItem*) row setProperties:properties];
	}
}

@end
