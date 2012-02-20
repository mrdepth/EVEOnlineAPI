//
//  EVECharWalletTransactions.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharWalletTransactions.h"


@implementation EVECharWalletTransactionsItem
@synthesize transactionDateTime;
@synthesize transactionID;
@synthesize quantity;
@synthesize typeName;
@synthesize typeID;
@synthesize price;
@synthesize clientID;
@synthesize clientName;
@synthesize stationID;
@synthesize stationName;
@synthesize transactionType;
@synthesize transactionFor;

+ (id) charWalletTransactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharWalletTransactionsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.transactionType = [attributeDict valueForKey:@"transactionType"];
		self.transactionFor = [attributeDict valueForKey:@"transactionFor"];
	}
	return self;
}

- (void) dealloc {
	[transactionDateTime release];
	[typeName release];
	[clientName release];
	[stationName release];
	[transactionType release];
	[transactionFor release];
	[super dealloc];
}

@end


@implementation EVECharWalletTransactions
@synthesize transactions;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) charWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID error:(NSError **)errorPtr {
	return [[[EVECharWalletTransactions alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeTransID:beforeTransID error:errorPtr] autorelease];
}

+ (id) charWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECharWalletTransactions alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeTransID:beforeTransID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/WalletTransactions.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, keyID, vCode, characterID,
														(beforeTransID > 0 ? [NSString stringWithFormat:@"&beforeTransID=%d", beforeTransID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/WalletTransactions.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, keyID, vCode, characterID,
														(beforeTransID > 0 ? [NSString stringWithFormat:@"&beforeTransID=%d", beforeTransID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[transactions release];
	[super dealloc];
}

- (void) cacheData {
	self.cachedUntil = [self.currentTime dateByAddingTimeInterval:3600];
	[super cacheData];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"transactions"]) {
		transactions = [[NSMutableArray alloc] init];
		return transactions;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"transactions"]) {
		EVECharWalletTransactionsItem *charWalletTransactionsItem = [EVECharWalletTransactionsItem charWalletTransactionsItemWithXMLAttributes:attributeDict];
		[transactions addObject:charWalletTransactionsItem];
		return charWalletTransactionsItem;
	}
	return nil;
}

@end