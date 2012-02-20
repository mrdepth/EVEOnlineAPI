//
//  EVEContractItems.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContractItems.h"


@implementation EVEContractItemsItem

@synthesize recordID;
@synthesize typeID;
@synthesize quantity;
@synthesize rawQuantity;
@synthesize singleton;
@synthesize included;

+ (id) contractItemsItemWithXMLAttributes:(NSDictionary*) attributeDict {
	return [[[EVEContractItemsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary*) attributeDict {
	if (self = [super init]) {
		self.recordID = [[attributeDict valueForKey:@"recordID"] longLongValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] integerValue];
		self.rawQuantity = [[attributeDict valueForKey:@"rawQuantity"] integerValue];
		self.singleton = [[attributeDict valueForKey:@"singleton"] boolValue];
		self.included = [[attributeDict valueForKey:@"included"] boolValue];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end


@implementation EVEContractItems
@synthesize itemList;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractItemsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEContractItems alloc] initWithKeyID:keyID vCode:vCode characterID:characterID contractID:contractID corporate:corporate error:errorPtr] autorelease];
}

+ (id) contractItemsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEContractItems alloc] initWithKeyID:keyID vCode:vCode characterID:characterID contractID:contractID corporate:corporate target:target action:action object:aObject] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractItems.xml.aspx?keyID=%d&vCode=%@&characterID=%d&contractID=%qi", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID, contractID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractItems.xml.aspx?keyID=%d&vCode=%@&characterID=%d&contractID=%qi", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID, contractID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[itemList release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"itemList"]) {
		itemList = [[NSMutableArray alloc] init];
		return itemList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"itemList"]) {
		EVEContractItemsItem *contractItemsItem = [EVEContractItemsItem contractItemsItemWithXMLAttributes:attributeDict];
		[itemList addObject:contractItemsItem];
		return contractItemsItem;
	}
	return nil;
}
@end