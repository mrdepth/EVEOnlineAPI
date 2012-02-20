//
//  EVEMetricsOrders.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMetricsOrders.h"


@implementation EVEMetricsOrderInfo
@synthesize eveID;
@synthesize sell;
@synthesize range;
@synthesize initialVolume;
@synthesize availableVolume;
@synthesize saleVolume;
@synthesize stationID;
@synthesize systemID;
@synthesize regionID;
@synthesize issuedAt;
@synthesize typeID;
@synthesize expiresAt;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize trusted;
@synthesize price;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.eveID = [[dictionary valueForKey:@"eve_id"] integerValue];
		self.sell = [[dictionary valueForKey:@"sell"] boolValue];
		self.range = [[dictionary valueForKey:@"range"] integerValue];
		self.initialVolume = [[dictionary valueForKey:@"initial_volume"] integerValue];
		self.availableVolume = [[dictionary valueForKey:@"available_volume"] integerValue];
		self.saleVolume = [[dictionary valueForKey:@"sale_volume"] integerValue];
		self.stationID = [[dictionary valueForKey:@"station_id"] integerValue];
		self.systemID = [[dictionary valueForKey:@"system_id"] integerValue];
		self.regionID = [[dictionary valueForKey:@"region_id"] integerValue];
		self.issuedAt = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"issued_at"]];
		self.typeID = [[dictionary valueForKey:@"type_id"] integerValue];
		self.expiresAt = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"expires_at"]];
		self.createdAt = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"created_at"]];
		self.updatedAt = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"updated_at"]];
		self.trusted = [[dictionary valueForKey:@"trusted"] boolValue];
		self.price = [[dictionary valueForKey:@"price"] floatValue];
	}
	return self;
}

- (NSComparisonResult) compareByPriceAscending: (EVEMetricsOrderInfo*) other {
	if (self.price < other.price)
		return NSOrderedAscending;
	else if (self.price > other.price)
		return NSOrderedDescending;
	else
		return NSOrderedSame;
}

- (NSComparisonResult) compareByPriceDescending: (EVEMetricsOrderInfo*) other {
	if (self.price > other.price)
		return NSOrderedAscending;
	else if (self.price < other.price)
		return NSOrderedDescending;
	else
		return NSOrderedSame;
}

- (void) dealloc {
	[issuedAt release];
	[expiresAt release];
	[createdAt release];
	[updatedAt release];
	[super dealloc];
}

@end


@implementation EVEMetricsOrdersRegion
@synthesize regionID;
@synthesize buyOrders;
@synthesize sellOrders;

- (void) dealloc {
	[buyOrders release];
	[sellOrders release];
	[super dealloc];
}

@end


@implementation EVEMetricsOrdersItemInfo
@synthesize typeName;
@synthesize typeID;
@synthesize regions;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.typeName = [dictionary valueForKey:@"type_name"];
		self.typeID = [[dictionary valueForKey:@"type_id"] integerValue];
		
		NSMutableDictionary *regionsDic = [NSMutableDictionary dictionary];
		
		for (NSDictionary *dic in [dictionary valueForKey:@"regions"]) {
			for (NSDictionary *orderDic in [dic valueForKey:@"orders"]) {
				EVEMetricsOrderInfo *order = [[[EVEMetricsOrderInfo alloc] initWithDictionary:orderDic] autorelease];
				NSMutableArray *orders = [regionsDic valueForKey:[[orderDic valueForKey:@"region_id"] stringValue]];
				if (!orders) {
					orders = [NSMutableArray array];
					[regionsDic setValue:orders forKey:[[orderDic valueForKey:@"region_id"] stringValue]];
				}
				[orders addObject:order];
			}
		}
		self.regions = [NSMutableArray array];
		for (NSString *regionID in [regionsDic allKeys]) {
			EVEMetricsOrdersRegion *region = [[EVEMetricsOrdersRegion alloc] init];
			region.regionID = [regionID integerValue];
			NSMutableArray *buyOrders = [NSMutableArray array];
			NSMutableArray *sellOrders = [NSMutableArray array];
			for (EVEMetricsOrderInfo *order in [regionsDic valueForKey:regionID]) {
				if (order.sell == YES)
					[sellOrders addObject:order];
				else
					[buyOrders addObject:order];
			}
			[buyOrders sortUsingSelector:@selector(compareByPriceDescending:)];
			[sellOrders sortUsingSelector:@selector(compareByPriceAscending:)];
			region.buyOrders = buyOrders;
			region.sellOrders = sellOrders;
			[regions addObject:region];
		}
	}
	return self;
}

- (void) dealloc {
	[typeName release];
	[regions release];
	[super dealloc];
}

@end


@implementation EVEMetricsOrders
@synthesize items;

+ (id) ordersWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr {
	return [[[EVEMetricsOrders alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs minQuantity:minQuantity apiKey:apiKey error:errorPtr] autorelease];
}

+ (id) ordersWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEMetricsOrders alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs minQuantity:minQuantity apiKey:apiKey target:target action:action object:aObject] autorelease];
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://eve-metrics.com/api/orders.json?key=%@&type_ids=%@%@%@",
														apiKey,
														[typeIDs componentsJoinedByString:@","],
														(regionIDs && regionIDs.count > 0) ? [NSString stringWithFormat:@"&region_ids=%@", [regionIDs componentsJoinedByString:@","]] : @"",
														(minQuantity > 0) ? [NSString stringWithFormat:@"&min_quantity=%d", minQuantity] : @""]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://eve-metrics.com/api/orders.json?key=%@&type_ids=%@%@%@",
														apiKey,
														[typeIDs componentsJoinedByString:@","],
														(regionIDs && regionIDs.count > 0) ? [NSString stringWithFormat:@"&region_ids=%@", [regionIDs componentsJoinedByString:@","]] : @"",
														(minQuantity > 0) ? [NSString stringWithFormat:@"&min_quantity=%d", minQuantity] : @""]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[items release];
	[super dealloc];
}

- (void) didParseObject: (id) object {
	self.items = [NSMutableArray array];
	for (NSDictionary *dic in object)
		[items addObject:[[[EVEMetricsOrdersItemInfo alloc] initWithDictionary:dic] autorelease]];
}

@end