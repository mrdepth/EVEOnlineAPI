//
//  EVECharContactList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharContactList.h"

@implementation EVECharContactListItem

+ (id) charContactListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharContactListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.contactID = [[attributeDict valueForKey:@"contactID"] integerValue];
		self.contactName = [attributeDict valueForKey:@"contactName"];
		self.inWatchlist = [[attributeDict valueForKey:@"inWatchlist"] compare:@"True" options:NSCaseInsensitiveSearch] == NSOrderedSame ? TRUE : FALSE;
		self.standing = [[attributeDict valueForKey:@"standing"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.contactID forKey:@"contactID"];
	[aCoder encodeObject:self.contactName forKey:@"contactName"];
	[aCoder encodeBool:self.inWatchlist forKey:@"inWatchlist"];
	[aCoder encodeFloat:self.standing forKey:@"standing"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.contactID = [aDecoder decodeIntegerForKey:@"contactID"];
		self.contactName = [aDecoder decodeObjectForKey:@"contactName"];
		self.inWatchlist = [aDecoder decodeBoolForKey:@"inWatchlist"];
		self.standing = [aDecoder decodeFloatForKey:@"standing"];
	}
	return self;
}

@end


@implementation EVECharContactList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) charContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharContactList alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"contactList"]) {
		self.contactList = [[NSMutableArray alloc] init];
		return self.contactList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"contactList"]) {
		EVECharContactListItem *charContactListItem = [EVECharContactListItem charContactListItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.contactList addObject:charContactListItem];
		return charContactListItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.contactList forKey:@"contactList"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.contactList = [aDecoder decodeObjectForKey:@"contactList"];
	}
	return self;
}

@end
