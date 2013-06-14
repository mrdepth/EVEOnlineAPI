//
//  EVEContractBids.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContractBids.h"


@implementation EVEContractBidsItem

+ (id) contractBidsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEContractBidsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.bidID = [[attributeDict valueForKey:@"bidID"] longLongValue];
		self.contractID = [[attributeDict valueForKey:@"contractID"] integerValue];
		self.bidderID = [[attributeDict valueForKey:@"bidderID"] integerValue];
		self.dateBid = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"dateBid"]];
		self.amount = [[attributeDict valueForKey:@"amount"] floatValue];
	}
	return self;
}

@end


@implementation EVEContractBids

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEContractBids alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractBids.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"bidList"]) {
		self.bidList = [[NSMutableArray alloc] init];
		return self.bidList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"bidList"]) {
		EVEContractBidsItem *contractBidsItem = [EVEContractBidsItem contractBidsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.bidList addObject:contractBidsItem];
		return contractBidsItem;
	}
	return nil;
}
@end