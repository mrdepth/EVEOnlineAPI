//
//  EVEMailingLists.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMailingLists.h"

@implementation EVEMailingListsItem
@synthesize listID;
@synthesize displayName;

+ (id) mailingListsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMailingListsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.listID = [[attributeDict valueForKey:@"listID"] integerValue];
		self.displayName = [attributeDict valueForKey:@"displayName"];
	}
	return self;
}

- (void) dealloc {
	[displayName release];
	[super dealloc];
}

@end


@implementation EVEMailingLists
@synthesize mailingLists;
@synthesize mailingListsMap;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) mailingListsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEMailingLists alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) mailingListsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMailingLists alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailingLists.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailingLists.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[mailingLists release];
	[mailingListsMap release];
	[super dealloc];
}

- (NSDictionary*) mailingListsMap {
	if (!mailingListsMap) {
		mailingListsMap = [[NSMutableDictionary alloc] initWithCapacity:mailingLists.count];
		for (EVEMailingListsItem* item in mailingLists)
			[mailingListsMap setValue:item forKey:[NSString stringWithFormat:@"%d", item.listID]];
	}
	return mailingListsMap;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"mailingLists"]) {
		mailingLists = [[NSMutableArray alloc] init];
		return mailingLists;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"mailingLists"]) {
		EVEMailingListsItem *mailingListsItem = [EVEMailingListsItem mailingListsItemWithXMLAttributes:attributeDict];
		[mailingLists addObject:mailingListsItem];
		return mailingListsItem;
	}
	return nil;
}

@end
