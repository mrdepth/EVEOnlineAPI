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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.bidID forKey:@"bidID"];
	[aCoder encodeInteger:self.contractID forKey:@"contractID"];
	[aCoder encodeInteger:self.bidderID forKey:@"bidderID"];
	[aCoder encodeObject:self.dateBid forKey:@"dateBid"];
	[aCoder encodeFloat:self.amount forKey:@"amount"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.bidID = [aDecoder decodeInt64ForKey:@"bidID"];
		self.contractID = [aDecoder decodeIntegerForKey:@"contractID"];
		self.bidderID = [aDecoder decodeIntegerForKey:@"bidderID"];
		self.dateBid = [aDecoder decodeObjectForKey:@"dateBid"];
		self.amount = [aDecoder decodeFloatForKey:@"amount"];
	}
	return self;
}

@end


@implementation EVEContractBids

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContractBids alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractBids.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.bidList forKey:@"bidList"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.bidList = [aDecoder decodeObjectForKey:@"bidList"];
	}
	return self;
}

@end