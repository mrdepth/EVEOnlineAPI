//
//  EVECorpWalletTransactions.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpWalletTransactions.h"


@implementation EVECorpWalletTransactionsItem

+ (id) corpWalletTransactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECorpWalletTransactionsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.transactionDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"transactionDateTime"]];
		self.transactionID = [[attributeDict valueForKey:@"transactionID"] integerValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] integerValue];
		self.typeName = [attributeDict valueForKey:@"typeName"];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.price = [[attributeDict valueForKey:@"price"] floatValue];
		self.clientID = [[attributeDict valueForKey:@"clientID"] integerValue];
		self.clientName = [attributeDict valueForKey:@"clientName"];
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.transactionType = [attributeDict valueForKey:@"transactionType"];
		self.transactionFor = [attributeDict valueForKey:@"transactionFor"];
	}
	return self;
}

@end


@implementation EVECorpWalletTransactions

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECorpWalletTransactions alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeTransID:beforeTransID accountKey:accountKey error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/WalletTransactions.xml.aspx?keyID=%d&vCode=%@&characterID=%d&accountKey=%d%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, accountKey, 
														(beforeTransID > 0 ? [NSString stringWithFormat:@"&beforeTransID=%d", beforeTransID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = [super parseData:data];
	self.cachedUntil = [self.currentTime dateByAddingTimeInterval:3600];
	self.cacheExpireDate = [self localTimeWithServerTime:self.cachedUntil];
	return error;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"transactions"]) {
		self.transactions = [[NSMutableArray alloc] init];
		return self.transactions;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"transactions"]) {
		EVECorpWalletTransactionsItem *corpWalletTransactionsItem = [EVECorpWalletTransactionsItem corpWalletTransactionsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.transactions addObject:corpWalletTransactionsItem];
		return corpWalletTransactionsItem;
	}
	return nil;
}

@end