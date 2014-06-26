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
		self.recordID = [[attributeDict valueForKey:@"recordID"] intValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] intValue];
		self.rawQuantity = [[attributeDict valueForKey:@"rawQuantity"] intValue];
		self.singleton = [[attributeDict valueForKey:@"singleton"] boolValue];
		self.included = [[attributeDict valueForKey:@"included"] boolValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.recordID forKey:@"recordID"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.quantity forKey:@"quantity"];
	[aCoder encodeInt32:self.rawQuantity forKey:@"rawQuantity"];
	[aCoder encodeBool:self.singleton forKey:@"singleton"];
	[aCoder encodeBool:self.included forKey:@"included"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.recordID = [aDecoder decodeInt32ForKey:@"recordID"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.quantity = [aDecoder decodeInt32ForKey:@"quantity"];
		self.rawQuantity = [aDecoder decodeInt32ForKey:@"rawQuantity"];
		self.singleton = [aDecoder decodeBoolForKey:@"singleton"];
		self.included = [aDecoder decodeBoolForKey:@"included"];
	}
	return self;
}

@end


@implementation EVEContractItems

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractItemsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID contractID:(int32_t) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContractItems alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID contractID:contractID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID contractID:(int32_t) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractItems.xml.aspx?keyID=%d&vCode=%@&characterID=%d&contractID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, contractID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.itemList forKey:@"itemList"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.itemList = [aDecoder decodeObjectForKey:@"itemList"];
	}
	return self;
}

@end