//
//  EVEAccountBalance.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAccountBalance.h"

@implementation EVEAccountBalanceItem

+ (id) accountBalanceItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEAccountBalanceItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.accountID = [[attributeDict valueForKey:@"accountID"] integerValue];
		self.accountKey = [[attributeDict valueForKey:@"accountKey"] integerValue];
		self.balance = [[attributeDict valueForKey:@"balance"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.accountID forKey:@"accountID"];
	[aCoder encodeInteger:self.accountKey forKey:@"accountKey"];
	[aCoder encodeFloat:self.balance forKey:@"balance"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.accountID = [aDecoder decodeIntegerForKey:@"accountID"];
		self.accountKey = [aDecoder decodeIntegerForKey:@"accountKey"];
		self.balance = [aDecoder decodeFloatForKey:@"balance"];
	}
	return self;
}

@end


@implementation EVEAccountBalance

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) accountBalanceWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEAccountBalance alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AccountBalance.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"accounts"]) {
		self.accounts = [[NSMutableArray alloc] init];
		return self.accounts;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"accounts"]) {
		EVEAccountBalanceItem *account = [EVEAccountBalanceItem accountBalanceItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.accounts addObject:account];
		return account;
	}
	else
		return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.accounts forKey:@"accounts"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.accounts = [aDecoder decodeObjectForKey:@"accounts"];
	}
	return self;
}

@end
