//
//  EVEMetricsHistory.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMetricsHistory.h"

@implementation EVEMetricsHistoryInfo
@synthesize min;
@synthesize max;
@synthesize avg;
@synthesize orders;
@synthesize amount;
@synthesize date;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.min = [[dictionary valueForKey:@"min"] floatValue];
		self.max = [[dictionary valueForKey:@"max"] floatValue];
		self.avg = [[dictionary valueForKey:@"avg"] floatValue];
		self.orders = [[dictionary valueForKey:@"orders"] integerValue];
		self.amount = [[dictionary valueForKey:@"amount"] integerValue];
		
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"yyyy-MM-dd"];
		self.date = [formatter dateFromString:[dictionary valueForKey:@"date"]];
		[formatter release];
	}
	return self;
}

- (void) dealloc {
	[date release];
	[super dealloc];
}

@end


@implementation EVEMetricsHistoryGlobal
@synthesize sell;
@synthesize buy;
@synthesize history;
@synthesize lastUpload;
@synthesize lastOrderUpload;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.sell = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"sell"]] autorelease];
		self.buy = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"buy"]] autorelease];

		self.history = [NSMutableArray array];
		for (NSDictionary *dic in [dictionary valueForKey:@"history"])
			[history addObject:[[[EVEMetricsHistoryInfo alloc] initWithDictionary:dic] autorelease]];
		
		self.lastUpload = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"last_upload"]];
		self.lastOrderUpload = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"last_order_upload"]];
	}
	return self;
}

- (void) dealloc {
	[sell release];
	[buy release];
	[history release];
	[lastUpload release];
	[lastOrderUpload release];
	[super dealloc];
}

@end


@implementation EVEMetricsHistoryRegion
@synthesize sell;
@synthesize buy;
@synthesize history;
@synthesize lastUpload;
@synthesize lastOrderUpload;
@synthesize regionID;
@synthesize regionName;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.sell = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"sell"]] autorelease];
		self.buy = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"buy"]] autorelease];
		
		self.history = [NSMutableArray array];
		for (NSDictionary *dic in [dictionary valueForKey:@"history"])
			[history addObject:[[[EVEMetricsHistoryInfo alloc] initWithDictionary:dic] autorelease]];
		
		self.lastUpload = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"last_upload"]];
		self.lastOrderUpload = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"last_order_upload"]];
		self.regionID = [[dictionary valueForKey:@"region_id"] integerValue];
		self.regionName = [dictionary valueForKey:@"region_name"];
	}
	return self;
}

- (void) dealloc {
	[sell release];
	[buy release];
	[history release];
	[lastUpload release];
	[regionName release];
	[lastOrderUpload release];
	[super dealloc];
}

@end


@implementation EVEMetricsHistoryItemInfo
@synthesize typeName;
@synthesize typeID;
@synthesize global;
@synthesize regions;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.typeName = [dictionary valueForKey:@"type_name"];
		self.typeID = [[dictionary valueForKey:@"type_id"] integerValue];
		self.global = [[[EVEMetricsHistoryGlobal alloc] initWithDictionary:[dictionary valueForKey:@"global"]] autorelease];

		self.regions = [NSMutableArray array];
		for (NSDictionary *dic in [dictionary valueForKey:@"regions"])
			[regions addObject:[[[EVEMetricsHistoryRegion alloc] initWithDictionary:dic] autorelease]];
	}
	return self;
}

- (void) dealloc {
	[typeName release];
	[global release];
	[regions release];
	[super dealloc];
}

@end


@implementation EVEMetricsHistory
@synthesize items;

+ (id) historyWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey error:(NSError **)errorPtr {
	return [[[EVEMetricsHistory alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs days:days apiKey:apiKey error:errorPtr] autorelease];
}

+ (id) historyWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEMetricsHistory alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs days:days apiKey:apiKey target:target action:action object:aObject] autorelease];
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://eve-metrics.com/api/history.json?key=%@&type_ids=%@%@%@",
														apiKey,
														[typeIDs componentsJoinedByString:@","],
														(regionIDs && regionIDs.count > 0) ? [NSString stringWithFormat:@"&region_ids=%@", [regionIDs componentsJoinedByString:@","]] : @"",
														(days > 0) ? [NSString stringWithFormat:@"&days=%d", days] : @""]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://eve-metrics.com/api/history.json?key=%@&type_ids=%@%@%@",
														apiKey,
														[typeIDs componentsJoinedByString:@","],
														(regionIDs && regionIDs.count > 0) ? [NSString stringWithFormat:@"&region_ids=%@", [regionIDs componentsJoinedByString:@","]] : @"",
														(days > 0) ? [NSString stringWithFormat:@"&days=%d", days] : @""]]
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
		[items addObject:[[[EVEMetricsHistoryItemInfo alloc] initWithDictionary:dic] autorelease]];
}

@end