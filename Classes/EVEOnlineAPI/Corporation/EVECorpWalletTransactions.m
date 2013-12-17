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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.transactionDateTime forKey:@"transactionDateTime"];
	[aCoder encodeInteger:self.transactionID forKey:@"transactionID"];
	[aCoder encodeInteger:self.quantity forKey:@"quantity"];
	[aCoder encodeObject:self.typeName forKey:@"typeName"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeFloat:self.price forKey:@"price"];
	[aCoder encodeInteger:self.clientID forKey:@"clientID"];
	[aCoder encodeObject:self.clientName forKey:@"clientName"];
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInteger:self.stationID forKey:@"stationID"];
	[aCoder encodeObject:self.stationName forKey:@"stationName"];
	[aCoder encodeObject:self.transactionType forKey:@"transactionType"];
	[aCoder encodeObject:self.transactionFor forKey:@"transactionFor"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.transactionDateTime = [aDecoder decodeObjectForKey:@"transactionDateTime"];
		self.transactionID = [aDecoder decodeIntegerForKey:@"transactionID"];
		self.quantity = [aDecoder decodeIntegerForKey:@"quantity"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.price = [aDecoder decodeFloatForKey:@"price"];
		self.clientID = [aDecoder decodeIntegerForKey:@"clientID"];
		self.clientName = [aDecoder decodeObjectForKey:@"clientName"];
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.stationID = [aDecoder decodeIntegerForKey:@"stationID"];
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.transactionType = [aDecoder decodeObjectForKey:@"transactionType"];
		self.transactionFor = [aDecoder decodeObjectForKey:@"transactionFor"];
	}
	return self;
}

@end


@implementation EVECorpWalletTransactions

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECorpWalletTransactions alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeTransID:beforeTransID accountKey:accountKey error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID accountKey: (NSInteger) accountKey error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.transactions forKey:@"transactions"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.transactions = [aDecoder decodeObjectForKey:@"transactions"];
	}
	return self;
}

@end