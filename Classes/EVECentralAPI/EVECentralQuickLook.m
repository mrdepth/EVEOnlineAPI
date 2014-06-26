//
//  EVECentralQuickLook.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralQuickLook.h"

@implementation EVECentralQuickLookOrder
+ (id) quickLookOrderWithDictionary: (NSDictionary*) dictionary {
	return [[EVECentralQuickLookOrder alloc] initWithDictionary:dictionary];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.orderID = [[dictionary valueForKey:@"id"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.orderID forKey:@"orderID"];
	[aCoder encodeInt32:self.regionID forKey:@"regionID"];
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	
	if  (self.stationName)
		[aCoder encodeObject:self.stationName forKey:@"stationName"];

	[aCoder encodeFloat:self.security forKey:@"security"];
	[aCoder encodeInt32:self.range forKey:@"range"];
	[aCoder encodeFloat:self.price forKey:@"price"];
	[aCoder encodeInt32:self.volRemain forKey:@"volRemain"];
	[aCoder encodeInt32:self.minVolume forKey:@"minVolume"];
	
	if  (self.expires)
		[aCoder encodeObject:self.expires forKey:@"expires"];
	if  (self.reportedTime)
		[aCoder encodeObject:self.reportedTime forKey:@"reportedTime"];

}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.orderID = [aDecoder decodeInt32ForKey:@"orderID"];
		self.regionID = [aDecoder decodeInt32ForKey:@"regionID"];
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		
		self.security = [aDecoder decodeFloatForKey:@"security"];
		self.range = [aDecoder decodeInt32ForKey:@"range"];
		self.price = [aDecoder decodeFloatForKey:@"price"];
		self.volRemain = [aDecoder decodeInt32ForKey:@"volRemain"];
		self.minVolume = [aDecoder decodeInt32ForKey:@"minVolume"];

		self.expires = [aDecoder decodeObjectForKey:@"expires"];
		self.reportedTime = [aDecoder decodeObjectForKey:@"reportedTime"];
	}
	return self;
}

@end


@interface EVECentralQuickLook()
@property (nonatomic, strong) NSMutableArray *currentOrders;
@property (nonatomic, strong) EVECentralQuickLookOrder *currentOrder;
@property (nonatomic, strong) NSDateFormatter *expiresDateFormatter;
@property (nonatomic, strong) NSDateFormatter *reportedTimeDateFormatter;

- (NSString*) argumentsStringWithTypeID: (int32_t) typeIDs regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) hours minQ: (int32_t) minQ;

@end


@implementation EVECentralQuickLook

+ (id) quickLookWithTypeID: (int32_t) typeID regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) hours minQ: (int32_t) minQ cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECentralQuickLook alloc] initWithTypeID:typeID regionIDs:regionIDs systemID:systemID hours:hours minQ:minQ cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithTypeID: (int32_t) aTypeID regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) aHours minQ: (int32_t) aMinQ cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/quicklook?%@",
														EVECentralAPIHost,
														[self argumentsStringWithTypeID:aTypeID regionIDs:regionIDs systemID:systemID hours:aHours minQ:aMinQ]]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	self.expiresDateFormatter = [[NSDateFormatter alloc] init];
	[self.expiresDateFormatter setDateFormat:@"yyyy-MM-dd"];
	[self.expiresDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
	self.reportedTimeDateFormatter = [[NSDateFormatter alloc] init];
	[self.reportedTimeDateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
	[self.reportedTimeDateFormatter setDefaultDate:[NSDate date]];
	[self.reportedTimeDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	self.expiresDateFormatter = nil;
	self.reportedTimeDateFormatter = nil;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	self.expiresDateFormatter = nil;
	self.reportedTimeDateFormatter = nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	
	if ([elementName isEqualToString:@"sell_orders"]) {
		self.currentOrders = [NSMutableArray array];
		self.sellOrders = self.currentOrders;
	}
	else if ([elementName isEqualToString:@"buy_orders"]) {
		self.currentOrders = [NSMutableArray array];
		self.buyOrders = self.currentOrders;
	}
	else if ([elementName isEqualToString:@"order"]) {
		self.currentOrder = [EVECentralQuickLookOrder quickLookOrderWithDictionary:attributeDict];
		[(NSMutableArray*) self.currentOrders addObject:self.currentOrder];
	}
	else if ([elementName isEqualToString:@"regions"])
		self.regions = [NSMutableArray array];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"item"])
		self.typeID = [self.validText intValue];
	else if ([elementName isEqualToString:@"itemname"])
		self.typeName = self.validText;
	else if ([elementName isEqualToString:@"region"]) {
		if (self.currentOrder)
			self.currentOrder.regionID = [self.validText intValue];
		else
			[(NSMutableArray*) self.regions addObject:self.validText];
	}
	else if ([elementName isEqualToString:@"hours"])
		self.hours = [self.validText intValue];
	else if ([elementName isEqualToString:@"minqty"])
		self.minQ = [self.validText intValue];
	else if ([elementName isEqualToString:@"station"])
		self.currentOrder.stationID = [self.validText intValue];
	else if ([elementName isEqualToString:@"station_name"])
		self.currentOrder.stationName = self.validText;
	else if ([elementName isEqualToString:@"security"])
		self.currentOrder.security = [self.validText floatValue];
	else if ([elementName isEqualToString:@"range"])
		self.currentOrder.range = [self.validText intValue];
	else if ([elementName isEqualToString:@"price"])
		self.currentOrder.price = [self.validText floatValue];
	else if ([elementName isEqualToString:@"vol_remain"])
		self.currentOrder.volRemain = [self.validText intValue];
	else if ([elementName isEqualToString:@"min_volume"])
		self.currentOrder.minVolume = [self.validText intValue];
	else if ([elementName isEqualToString:@"expires"])
		self.currentOrder.expires = [self.expiresDateFormatter dateFromString:self.validText];
	else if ([elementName isEqualToString:@"reported_time"])
		self.currentOrder.reportedTime = [self.reportedTimeDateFormatter dateFromString:self.validText];
	
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	
	if  (self.typeName)
		[aCoder encodeObject:self.typeName forKey:@"typeName"];
	if  (self.regions)
		[aCoder encodeObject:self.regions forKey:@"regions"];
	
	[aCoder encodeInt32:self.hours forKey:@"hours"];
	[aCoder encodeInt32:self.minQ forKey:@"minQ"];
	
	if  (self.sellOrders)
		[aCoder encodeObject:self.sellOrders forKey:@"sellOrders"];
	if  (self.buyOrders)
		[aCoder encodeObject:self.buyOrders forKey:@"buyOrders"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
		self.regions = [aDecoder decodeObjectForKey:@"regions"];
		self.hours = [aDecoder decodeInt32ForKey:@"hours"];
		self.minQ = [aDecoder decodeInt32ForKey:@"minQ"];
		self.sellOrders = [aDecoder decodeObjectForKey:@"sellOrders"];
		self.buyOrders = [aDecoder decodeObjectForKey:@"buyOrders"];
	}
	return self;
}

#pragma mark - Private

- (NSString*) argumentsStringWithTypeID: (int32_t) aTypeID regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) aHours minQ: (int32_t) aMinQ {
	NSMutableArray *regionIDsArgs = [NSMutableArray array];
	
	for (NSNumber *regionID in regionIDs)
		[regionIDsArgs addObject:[NSString stringWithFormat:@"regionlimit=%@", regionID]];
	
	NSMutableString *argumentsString = [NSMutableString stringWithFormat:@"typeid=%d", aTypeID];
	
	if (regionIDsArgs.count > 0)
		[argumentsString appendFormat:@"&%@", [regionIDsArgs componentsJoinedByString:@"&"]];
	
	if (aHours)
		[argumentsString appendFormat:@"&sethours=%d", aHours];
	
	if (aMinQ)
		[argumentsString appendFormat:@"&setminQ=%d", aMinQ];
	
	if (systemID)
		[argumentsString appendFormat:@"&usesystem=%d", systemID];
	
	return argumentsString;
}

@end