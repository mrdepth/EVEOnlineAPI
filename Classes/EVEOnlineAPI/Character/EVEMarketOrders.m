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
		self.orderID = [[attributeDict valueForKey:@"orderID"] intValue];
		self.charID = [[attributeDict valueForKey:@"charID"] intValue];
		self.stationID = [[attributeDict valueForKey:@"stationID"] intValue];
		self.volEntered = [[attributeDict valueForKey:@"volEntered"] intValue];
		self.volRemaining = [[attributeDict valueForKey:@"volRemaining"] intValue];
		self.minVolume = [[attributeDict valueForKey:@"minVolume"] intValue];
		self.orderState = [[attributeDict valueForKey:@"orderState"] intValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.range = [[attributeDict valueForKey:@"range"] intValue];
		self.accountKey = [[attributeDict valueForKey:@"accountKey"] intValue];
		self.duration = [[attributeDict valueForKey:@"duration"] intValue];
		self.escrow = [[attributeDict valueForKey:@"escrow"] floatValue];
		self.price = [[attributeDict valueForKey:@"price"] floatValue];
		self.bid = [[attributeDict valueForKey:@"bid"] boolValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.orderID forKey:@"orderID"];
	[aCoder encodeInt32:self.charID forKey:@"charID"];
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	[aCoder encodeInt32:self.volEntered forKey:@"volEntered"];
	[aCoder encodeInt32:self.volRemaining forKey:@"volRemaining"];
	[aCoder encodeInt32:self.minVolume forKey:@"minVolume"];
	[aCoder encodeInt32:self.orderState forKey:@"orderState"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.range forKey:@"range"];
	[aCoder encodeInt32:self.accountKey forKey:@"accountKey"];
	[aCoder encodeInt32:self.duration forKey:@"duration"];
	[aCoder encodeFloat:self.escrow forKey:@"escrow"];
	[aCoder encodeFloat:self.price forKey:@"price"];
	[aCoder encodeBool:self.bid forKey:@"bid"];
	[aCoder encodeObject:self.issued forKey:@"issued"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.orderID = [aDecoder decodeInt32ForKey:@"orderID"];
		self.charID = [aDecoder decodeInt32ForKey:@"charID"];
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		self.volEntered = [aDecoder decodeInt32ForKey:@"volEntered"];
		self.volRemaining = [aDecoder decodeInt32ForKey:@"volRemaining"];
		self.minVolume = [aDecoder decodeInt32ForKey:@"minVolume"];
		self.orderState = [aDecoder decodeInt32ForKey:@"orderState"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.range = [aDecoder decodeInt32ForKey:@"range"];
		self.accountKey = [aDecoder decodeInt32ForKey:@"accountKey"];
		self.duration = [aDecoder decodeInt32ForKey:@"duration"];
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

+ (id) marketOrdersWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMarketOrders alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/MarketOrders.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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
