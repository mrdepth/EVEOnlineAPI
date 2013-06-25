//
//  EVEContractItems.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContractItems.h"


@implementation EVEContractItemsItem

+ (id) contractItemsItemWithXMLAttributes:(NSDictionary*) attributeDict {
	return [[EVEContractItemsItem alloc] initWithXMLAttributes:attributeDict];
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

@end


@implementation EVEContractItems

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractItemsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEContractItems alloc] initWithKeyID:keyID vCode:vCode characterID:characterID contractID:contractID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractItems.xml.aspx?keyID=%d&vCode=%@&characterID=%d&contractID=%qi", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, contractID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"itemList"]) {
		self.itemList = [[NSMutableArray alloc] init];
		return self.itemList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"itemList"]) {
		EVEContractItemsItem *contractItemsItem = [EVEContractItemsItem contractItemsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.itemList addObject:contractItemsItem];
		return contractItemsItem;
	}
	return nil;
}
@end