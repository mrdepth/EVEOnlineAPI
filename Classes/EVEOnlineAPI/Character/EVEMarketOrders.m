//
//  EVEMarketOrders.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMarketOrders.h"


@implementation EVEMarketOrdersItem
@synthesize orderID;
@synthesize charID;
@synthesize stationID;
@synthesize volEntered;
@synthesize volRemaining;
@synthesize minVolume;
@synthesize orderState;
@synthesize typeID;
@synthesize range;
@synthesize accountKey;
@synthesize duration;
@synthesize escrow;
@synthesize price;
@synthesize bid;
@synthesize issued;

+ (id) marketOrdersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMarketOrdersItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.orderID = [[attributeDict valueForKey:@"orderID"] integerValue];
		self.charID = [[attributeDict valueForKey:@"charID"] integerValue];
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.volEntered = [[attributeDict valueForKey:@"volEntered"] integerValue];
		self.volRemaining = [[attributeDict valueForKey:@"volRemaining"] integerValue];
		self.minVolume = [[attributeDict valueForKey:@"minVolume"] integerValue];
		self.orderState = [[attributeDict valueForKey:@"orderState"] integerValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.range = [[attributeDict valueForKey:@"range"] integerValue];
		self.accountKey = [[attributeDict valueForKey:@"accountKey"] integerValue];
		self.duration = [[attributeDict valueForKey:@"duration"] integerValue];
		self.escrow = [[attributeDict valueForKey:@"escrow"] floatValue];
		self.price = [[attributeDict valueForKey:@"price"] floatValue];
		self.bid = [[attributeDict valueForKey:@"bid"] boolValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
	}
	return self;
}

- (void) dealloc {
	[issued release];
	[super dealloc];
}
@end


@implementation EVEMarketOrders
@synthesize orders;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) marketOrdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEMarketOrders alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) marketOrdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMarketOrders alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/MarketOrders.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/MarketOrders.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[orders release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"orders"]) {
		orders = [[NSMutableArray alloc] init];
		return orders;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"orders"]) {
		EVEMarketOrdersItem *order = [EVEMarketOrdersItem marketOrdersItemWithXMLAttributes:attributeDict];
		[orders addObject:order];
		return order;
	}
	else
		return nil;
}

@end
