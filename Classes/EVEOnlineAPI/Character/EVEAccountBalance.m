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

@end


@implementation EVEAccountBalance

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) accountBalanceWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEAccountBalance alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AccountBalance.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

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

@end
