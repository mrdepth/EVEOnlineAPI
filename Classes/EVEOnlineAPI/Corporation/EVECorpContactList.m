//
//  EVECorpContactList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpContactList.h"


@implementation EVECorpContactListItem

@synthesize contactID;
@synthesize contactName;
@synthesize standing;

+ (id) corpContactListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECorpContactListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.contactID = [[attributeDict valueForKey:@"contactID"] integerValue];
		self.contactName = [attributeDict valueForKey:@"contactName"];
		self.standing = [[attributeDict valueForKey:@"standing"] floatValue];
	}
	return self;
}

- (void) dealloc {
	[contactName release];
	[super dealloc];
}

@end


@implementation EVECorpContactList
@synthesize corporateContactList;
@synthesize allianceContactList;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVECorpContactList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) corpContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECorpContactList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContactList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContactList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[corporateContactList release];
	[allianceContactList release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"corporateContactList"]) {
		corporateContactList = [[NSMutableArray alloc] init];
		return corporateContactList;
	}
	else if ([rowset isEqualToString:@"allianceContactList"]) {
		allianceContactList = [[NSMutableArray alloc] init];
		return allianceContactList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"corporateContactList"] || [rowset isEqualToString:@"allianceContactList"]) {
		EVECorpContactListItem *corpContactListItem = [EVECorpContactListItem corpContactListItemWithXMLAttributes:attributeDict];
		[object addObject:corpContactListItem];
		return corpContactListItem;
	}
	return nil;
}
@end
