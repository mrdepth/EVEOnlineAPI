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
@synthesize orderID;
@synthesize regionID;
@synthesize region;
@synthesize stationID;
@synthesize station;
@synthesize stationName;
@synthesize security;
@synthesize range;
@synthesize price;
@synthesize volRemain;
@synthesize minVolume;
@synthesize expires;
@synthesize reportedTime;

+ (id) quickLookOrderWithDictionary: (NSDictionary*) dictionary {
	return [[[EVECentralQuickLookOrder alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.orderID = [[dictionary valueForKey:@"id"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[region release];
	[stationName release];
	[station release];
	[expires release];
	[reportedTime release];
	[super dealloc];
}

- (EVEDBMapRegion*) region {
	if (regionID == 0)
		return NULL;
	if (!region) {
		region = [[EVEDBMapRegion mapRegionWithRegionID:regionID error:nil] retain];
		if (!region)
			region = (EVEDBMapRegion*) [[NSNull null] retain];
	}
	if ((NSNull*) region == [NSNull null])
		return NULL;
	else
		return region;
}

- (EVEDBStaStation*) station {
	if (stationID == 0)
		return NULL;
	if (!station) {
		station = [[EVEDBStaStation staStationWithStationID:stationID error:nil] retain];
		if (!station)
			station = (EVEDBStaStation*) [[NSNull null] retain];
	}
	if ((NSNull*) station == [NSNull null])
		return NULL;
	else
		return station;
}

@end



@implementation EVECentralQuickLook(Private)

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


@implementation EVECentralQuickLook
@synthesize typeID;
@synthesize typeName;
@synthesize regions;
@synthesize hours;
@synthesize minQ;
@synthesize sellOrders;
@synthesize buyOrders;

+ (id) quickLookWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr {
	return [[[EVECentralQuickLook alloc] initWithTypeID:typeID regionIDs:regionIDs systemID:systemID hours:hours minQ:minQ error:errorPtr] autorelease];
}

+ (id) quickLookWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVECentralQuickLook alloc] initWithTypeID:typeID regionIDs:regionIDs systemID:systemID hours:hours minQ:minQ target:target action:action object:aObject] autorelease];
}

- (id) initWithTypeID: (NSInteger) aTypeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) aHours minQ: (NSInteger) aMinQ error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/quicklook?%@",
														EVECentralAPIHost,
														[self argumentsStringWithTypeID:aTypeID regionIDs:regionIDs systemID:systemID hours:aHours minQ:aMinQ]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTypeID: (NSInteger) aTypeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) aHours minQ: (NSInteger) aMinQ target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/quicklook?%@",
														EVECentralAPIHost,
														[self argumentsStringWithTypeID:aTypeID regionIDs:regionIDs systemID:systemID hours:aHours minQ:aMinQ]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[typeName release];
	[regions release];
	[sellOrders release];
	[buyOrders release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	expiresDateFormatter = [[NSDateFormatter alloc] init];
	[expiresDateFormatter setDateFormat:@"yyyy-MM-dd"];
	reportedTimeDateFormatter = [[NSDateFormatter alloc] init];
	[reportedTimeDateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
	[reportedTimeDateFormatter setDefaultDate:[NSDate date]];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	[expiresDateFormatter release];
	expiresDateFormatter = nil;
	[reportedTimeDateFormatter release];
	reportedTimeDateFormatter = nil;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	[expiresDateFormatter release];
	expiresDateFormatter = nil;
	[reportedTimeDateFormatter release];
	reportedTimeDateFormatter = nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	
	if ([elementName isEqualToString:@"sell_orders"]) {
		currentOrders = [NSMutableArray array];
		self.sellOrders = currentOrders;
	}
	else if ([elementName isEqualToString:@"buy_orders"]) {
		currentOrders = [NSMutableArray array];
		self.buyOrders = currentOrders;
	}
	else if ([elementName isEqualToString:@"order"]) {
		currentOrder = [EVECentralQuickLookOrder quickLookOrderWithDictionary:attributeDict];
		[currentOrders addObject:currentOrder];
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
		self.typeID = [self.text integerValue];
	else if ([elementName isEqualToString:@"itemname"])
		self.typeName = self.text;
	else if ([elementName isEqualToString:@"region"]) {
		if (currentOrder)
			currentOrder.regionID = [self.text integerValue];
		else
			[regions addObject:self.text];
	}
	else if ([elementName isEqualToString:@"hours"])
		self.hours = [self.text integerValue];
	else if ([elementName isEqualToString:@"minqty"])
		self.minQ = [self.text integerValue];
	else if ([elementName isEqualToString:@"station"])
		currentOrder.stationID = [self.text integerValue];
	else if ([elementName isEqualToString:@"station_name"])
		currentOrder.stationName = self.text;
	else if ([elementName isEqualToString:@"security"])
		currentOrder.security = [self.text floatValue];
	else if ([elementName isEqualToString:@"range"])
		currentOrder.range = [self.text integerValue];
	else if ([elementName isEqualToString:@"price"])
		currentOrder.price = [self.text floatValue];
	else if ([elementName isEqualToString:@"vol_remain"])
		currentOrder.volRemain = [self.text integerValue];
	else if ([elementName isEqualToString:@"min_volume"])
		currentOrder.minVolume = [self.text integerValue];
	else if ([elementName isEqualToString:@"expires"])
		currentOrder.expires = [expiresDateFormatter dateFromString:self.text];
	else if ([elementName isEqualToString:@"reported_time"])
		currentOrder.reportedTime = [reportedTimeDateFormatter dateFromString:self.text];
	
}

@end