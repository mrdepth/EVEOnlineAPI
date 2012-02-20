//
//  EVEAccountBalance.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAccountBalance.h"

@implementation EVEAccountBalanceItem
@synthesize accountID;
@synthesize accountKey;
@synthesize balance;

+ (id) accountBalanceItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEAccountBalanceItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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
@synthesize accounts;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) accountBalanceWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEAccountBalance alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) accountBalanceWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEAccountBalance alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AccountBalance.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AccountBalance.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[accounts release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"accounts"]) {
		accounts = [[NSMutableArray alloc] init];
		return accounts;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"accounts"]) {
		EVEAccountBalanceItem *account = [EVEAccountBalanceItem accountBalanceItemWithXMLAttributes:attributeDict];
		[accounts addObject:account];
		return account;
	}
	else
		return nil;
}

@end
