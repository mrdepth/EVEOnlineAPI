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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.recordID forKey:@"recordID"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeInteger:self.quantity forKey:@"quantity"];
	[aCoder encodeInteger:self.rawQuantity forKey:@"rawQuantity"];
	[aCoder encodeBool:self.singleton forKey:@"singleton"];
	[aCoder encodeBool:self.included forKey:@"included"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.recordID = [aDecoder decodeInt64ForKey:@"recordID"];
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.quantity = [aDecoder decodeIntegerForKey:@"quantity"];
		self.rawQuantity = [aDecoder decodeIntegerForKey:@"rawQuantity"];
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


+ (id) contractItemsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContractItems alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID contractID:contractID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID contractID:(long long) contractID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractItems.xml.aspx?keyID=%d&vCode=%@&characterID=%d&contractID=%qi", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, contractID]]
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