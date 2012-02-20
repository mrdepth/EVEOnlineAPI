//
//  EVEContractBids.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContractBids.h"


@implementation EVEContractBidsItem

@synthesize bidID;
@synthesize contractID;
@synthesize bidderID;
@synthesize dateBid;
@synthesize amount;

+ (id) contractBidsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEContractBidsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[dateBid release];
	[super dealloc];
}

@end


@implementation EVEContractBids
@synthesize bidList;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEContractBids alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEContractBids alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:aObject] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractBids.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/ContractBids.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[bidList release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"bidList"]) {
		bidList = [[NSMutableArray alloc] init];
		return bidList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"bidList"]) {
		EVEContractBidsItem *contractBidsItem = [EVEContractBidsItem contractBidsItemWithXMLAttributes:attributeDict];
		[bidList addObject:contractBidsItem];
		return contractBidsItem;
	}
	return nil;
}
@end