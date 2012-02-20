//
//  EVECharContactList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharContactList.h"

@implementation EVECharContactListItem

@synthesize contactID;
@synthesize contactName;
@synthesize inWatchlist;
@synthesize standing;

+ (id) charContactListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharContactListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[contactName release];
	[super dealloc];
}

@end


@implementation EVECharContactList
@synthesize contactList;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) charContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVECharContactList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) charContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECharContactList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/ContactList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[contactList release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"contactList"]) {
		contactList = [[NSMutableArray alloc] init];
		return contactList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"contactList"]) {
		EVECharContactListItem *charContactListItem = [EVECharContactListItem charContactListItemWithXMLAttributes:attributeDict];
		[contactList addObject:charContactListItem];
		return charContactListItem;
	}
	return nil;
}
@end
