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
		self.accountID = [[attributeDict valueForKey:@"accountID"] intValue];
		self.accountKey = [[attributeDict valueForKey:@"accountKey"] intValue];
		self.balance = [[attributeDict valueForKey:@"balance"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.accountID forKey:@"accountID"];
	[aCoder encodeInt32:self.accountKey forKey:@"accountKey"];
	[aCoder encodeFloat:self.balance forKey:@"balance"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.accountID = [aDecoder decodeInt32ForKey:@"accountID"];
		self.accountKey = [aDecoder decodeInt32ForKey:@"accountKey"];
		self.balance = [aDecoder decodeFloatForKey:@"balance"];
	}
	return self;
}

@end


@implementation EVEAccountBalance

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) accountBalanceWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEAccountBalance alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AccountBalance.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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
