//
//  EVEMailingLists.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMailingLists.h"

@implementation EVEMailingListsItem

+ (id) mailingListsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMailingListsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.listID = [[attributeDict valueForKey:@"listID"] integerValue];
		self.displayName = [attributeDict valueForKey:@"displayName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.listID forKey:@"listID"];
	[aCoder encodeObject:self.displayName forKey:@"displayName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.listID = [aDecoder decodeIntegerForKey:@"listID"];
		self.displayName = [aDecoder decodeObjectForKey:@"displayName"];
	}
	return self;
}

@end


@implementation EVEMailingLists

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) mailingListsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMailingLists alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailingLists.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSDictionary*) mailingListsMap {
	if (!_mailingListsMap) {
		_mailingListsMap = [[NSMutableDictionary alloc] initWithCapacity:self.mailingLists.count];
		for (EVEMailingListsItem* item in self.mailingLists)
			((NSMutableDictionary*)_mailingListsMap)[@(item.listID)] = item;
	}
	return _mailingListsMap;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"mailingLists"]) {
		self.mailingLists = [[NSMutableArray alloc] init];
		return self.mailingLists;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"mailingLists"]) {
		EVEMailingListsItem *mailingListsItem = [EVEMailingListsItem mailingListsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.mailingLists addObject:mailingListsItem];
		return mailingListsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.mailingLists forKey:@"mailingLists"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.mailingLists = [aDecoder decodeObjectForKey:@"mailingLists"];
	}
	return self;
}

@end
