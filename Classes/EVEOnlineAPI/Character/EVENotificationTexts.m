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
		self.notificationID = [[attributeDict valueForKey:@"notificationID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.notificationID forKey:@"notificationID"];
	[aCoder encodeObject:self.properties forKey:@"properties"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.notificationID = [aDecoder decodeInt32ForKey:@"notificationID"];
		self.properties = [aDecoder decodeObjectForKey:@"properties"];
	}
	return self;
}

@end


@implementation EVENotificationTexts

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) notificationTextsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID ids: (NSArray*) ids error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVENotificationTexts alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID ids:ids error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID ids: (NSArray*) ids error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/NotificationTexts.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, [ids componentsJoinedByString:@","]]]
					   cachePolicy:cachePolicy
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
