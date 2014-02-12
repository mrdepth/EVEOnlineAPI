//
//  EVECentralQuickLook.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralQuickLook.h"
#import "EVEDBAPI.h"


@implementation EVECentralQuickLookOrder
+ (id) quickLookOrderWithDictionary: (NSDictionary*) dictionary {
	return [[EVECentralQuickLookOrder alloc] initWithDictionary:dictionary];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.orderID = [[dictionary valueForKey:@"id"] integerValue];
	}
	return self;
}

- (EVEDBMapRegion*) region {
	if (self.regionID == 0)
		return nil;
	if (!_region) {
		_region = [EVEDBMapRegion mapRegionWithRegionID:self.regionID error:nil];
		if (!_region)
			_region = (EVEDBMapRegion*) [NSNull null];
	}
	if ((NSNull*) _region == [NSNull null])
		return nil;
	else
		return _region;
}

- (EVEDBStaStation*) station {
	if (self.stationID == 0)
		return nil;
	if (!_station) {
		_station = [EVEDBStaStation staStationWithStationID:self.stationID error:nil];
		if (!_station)
			_station = (EVEDBStaStation*) [NSNull null];
	}
	if ((NSNull*) _station == [NSNull null])
		return nil;
	else
		return _station;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.orderID forKey:@"orderID"];
	[aCoder encodeInteger:self.regionID forKey:@"regionID"];
	[aCoder encodeInteger:self.stationID forKey:@"stationID"];
	
	if  (self.stationName)
		[aCoder encodeObject:self.stationName forKey:@"stationName"];

	[aCoder encodeFloat:self.security forKey:@"security"];
	[aCoder encodeInteger:self.range forKey:@"range"];
	[aCoder encodeFloat:self.price forKey:@"price"];
	[aCoder encodeInteger:self.volRemain forKey:@"volRemain"];
	[aCoder encodeInteger:self.minVolume forKey:@"minVolume"];
	
	if  (self.expires)
		[aCoder encodeObject:self.expires forKey:@"expires"];
	if  (self.reportedTime)
		[aCoder encodeObject:self.reportedTime forKey:@"reportedTime"];

}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.orderID = [aDecoder decodeIntegerForKey:@"orderID"];
		self.regionID = [aDecoder decodeIntegerForKey:@"regionID"];
		self.stationID = [aDecoder decodeIntegerForKey:@"stationID"];
		
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		
		self.security = [aDecoder decodeFloatForKey:@"security"];
		self.range = [aDecoder decodeIntegerForKey:@"range"];
		self.price = [aDecoder decodeFloatForKey:@"price"];
		self.volRemain = [aDecoder decodeIntegerForKey:@"volRemain"];
		self.minVolume = [aDecoder decodeIntegerForKey:@"minVolume"];

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

- (NSString*) argumentsStringWithTypeID: (NSInteger) typeIDs regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ;

@end


@implementation EVECentralQuickLook

+ (id) quickLookWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECentralQuickLook alloc] initWithTypeID:typeID regionIDs:regionIDs systemID:systemID hours:hours minQ:minQ cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithTypeID: (NSInteger) aTypeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) aHours minQ: (NSInteger) aMinQ cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
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
		self.typeID = [self.validText integerValue];
	else if ([elementName isEqualToString:@"itemname"])
		self.typeName = self.validText;
	else if ([elementName isEqualToString:@"region"]) {
		if (self.currentOrder)
			self.currentOrder.regionID = [self.validText integerValue];
		else
			[(NSMutableArray*) self.regions addObject:self.validText];
	}
	else if ([elementName isEqualToString:@"hours"])
		self.hours = [self.validText integerValue];
	else if ([elementName isEqualToString:@"minqty"])
		self.minQ = [self.validText integerValue];
	else if ([elementName isEqualToString:@"station"])
		self.currentOrder.stationID = [self.validText integerValue];
	else if ([elementName isEqualToString:@"station_name"])
		self.currentOrder.stationName = self.validText;
	else if ([elementName isEqualToString:@"security"])
		self.currentOrder.security = [self.validText floatValue];
	else if ([elementName isEqualToString:@"range"])
		self.currentOrder.range = [self.validText integerValue];
	else if ([elementName isEqualToString:@"price"])
		self.currentOrder.price = [self.validText floatValue];
	else if ([elementName isEqualToString:@"vol_remain"])
		self.currentOrder.volRemain = [self.validText integerValue];
	else if ([elementName isEqualToString:@"min_volume"])
		self.currentOrder.minVolume = [self.validText integerValue];
	else if ([elementName isEqualToString:@"expires"])
		self.currentOrder.expires = [self.expiresDateFormatter dateFromString:self.validText];
	else if ([elementName isEqualToString:@"reported_time"])
		self.currentOrder.reportedTime = [self.reportedTimeDateFormatter dateFromString:self.validText];
	
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	
	if  (self.typeName)
		[aCoder encodeObject:self.typeName forKey:@"typeName"];
	if  (self.regions)
		[aCoder encodeObject:self.regions forKey:@"regions"];
	
	[aCoder encodeInteger:self.hours forKey:@"hours"];
	[aCoder encodeInteger:self.minQ forKey:@"minQ"];
	
	if  (self.sellOrders)
		[aCoder encodeObject:self.sellOrders forKey:@"sellOrders"];
	if  (self.buyOrders)
		[aCoder encodeObject:self.buyOrders forKey:@"buyOrders"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
		self.regions = [aDecoder decodeObjectForKey:@"regions"];
		self.hours = [aDecoder decodeIntegerForKey:@"hours"];
		self.minQ = [aDecoder decodeIntegerForKey:@"minQ"];
		self.sellOrders = [aDecoder decodeObjectForKey:@"sellOrders"];
		self.buyOrders = [aDecoder decodeObjectForKey:@"buyOrders"];
	}
	return self;
}

#pragma mark - Private

- (NSString*) argumentsStringWithTypeID: (NSInteger) aTypeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) aHours minQ: (NSInteger) aMinQ {
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