//
//  EVEMarketOrders.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMarketOrders.h"


@implementation EVEMarketOrdersItem

+ (id) marketOrdersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMarketOrdersItem alloc] initWithXMLAttributes:attributeDict];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.orderID forKey:@"orderID"];
	[aCoder encodeInteger:self.charID forKey:@"charID"];
	[aCoder encodeInteger:self.stationID forKey:@"stationID"];
	[aCoder encodeInteger:self.volEntered forKey:@"volEntered"];
	[aCoder encodeInteger:self.volRemaining forKey:@"volRemaining"];
	[aCoder encodeInteger:self.minVolume forKey:@"minVolume"];
	[aCoder encodeInteger:self.orderState forKey:@"orderState"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeInteger:self.range forKey:@"range"];
	[aCoder encodeInteger:self.accountKey forKey:@"accountKey"];
	[aCoder encodeInteger:self.duration forKey:@"duration"];
	[aCoder encodeFloat:self.escrow forKey:@"escrow"];
	[aCoder encodeFloat:self.price forKey:@"price"];
	[aCoder encodeBool:self.bid forKey:@"bid"];
	[aCoder encodeObject:self.issued forKey:@"issued"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.orderID = [aDecoder decodeIntegerForKey:@"orderID"];
		self.charID = [aDecoder decodeIntegerForKey:@"charID"];
		self.stationID = [aDecoder decodeIntegerForKey:@"stationID"];
		self.volEntered = [aDecoder decodeIntegerForKey:@"volEntered"];
		self.volRemaining = [aDecoder decodeIntegerForKey:@"volRemaining"];
		self.minVolume = [aDecoder decodeIntegerForKey:@"minVolume"];
		self.orderState = [aDecoder decodeIntegerForKey:@"orderState"];
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.range = [aDecoder decodeIntegerForKey:@"range"];
		self.accountKey = [aDecoder decodeIntegerForKey:@"accountKey"];
		self.duration = [aDecoder decodeIntegerForKey:@"duration"];
		self.escrow = [aDecoder decodeFloatForKey:@"escrow"];
		self.price = [aDecoder decodeFloatForKey:@"price"];
		self.bid = [aDecoder decodeBoolForKey:@"bid"];
		self.issued = [aDecoder decodeObjectForKey:@"issued"];
	}
	return self;
}

@end


@implementation EVEMarketOrders

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) marketOrdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMarketOrders alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/MarketOrders.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"orders"]) {
		self.orders = [[NSMutableArray alloc] init];
		return self.orders;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"orders"]) {
		EVEMarketOrdersItem *order = [EVEMarketOrdersItem marketOrdersItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.orders addObject:order];
		return order;
	}
	else
		return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.orders forKey:@"orders"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.orders = [aDecoder decodeObjectForKey:@"orders"];
	}
	return self;
}

@end
