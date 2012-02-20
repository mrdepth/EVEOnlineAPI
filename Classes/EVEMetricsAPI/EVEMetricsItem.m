//
//  EVEMetricsItem.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMetricsItem.h"

@implementation EVEMetricsItemGlobal
@synthesize sell;
@synthesize buy;
@synthesize lastUpload;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.sell = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"sell"]] autorelease];
		self.buy = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"buy"]] autorelease];
		self.lastUpload = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"last_upload"]];
	}
	return self;
}

- (void) dealloc {
	[sell release];
	[buy release];
	[lastUpload release];
	[super dealloc];
}

@end


@implementation EVEMetricsItemRegion
@synthesize sell;
@synthesize buy;
@synthesize lastUpload;
@synthesize regionID;
@synthesize regionName;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.sell = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"sell"]] autorelease];
		self.buy = [[[EVEMetricsItemPrice alloc] initWithDictionary:[dictionary valueForKey:@"buy"]] autorelease];
		self.lastUpload = [[NSDateFormatter eveMetricsDateFormatter] dateFromString:[dictionary valueForKey:@"last_upload"]];
		self.regionID = [[dictionary valueForKey:@"region_id"] integerValue];
		self.regionName = [dictionary valueForKey:@"region_name"];
	}
	return self;
}

- (void) dealloc {
	[sell release];
	[buy release];
	[lastUpload release];
	[regionName release];
	[super dealloc];
}

@end


@implementation EVEMetricsItemInfo
@synthesize typeName;
@synthesize typeID;
@synthesize global;
@synthesize regions;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.typeName = [dictionary valueForKey:@"type_name"];
		self.typeID = [[dictionary valueForKey:@"type_id"] integerValue];
		self.global = [[[EVEMetricsItemGlobal alloc] initWithDictionary:[dictionary valueForKey:@"global"]] autorelease];
		self.regions = [NSMutableArray array];
		for (NSDictionary *dic in [dictionary valueForKey:@"regions"])
			[regions addObject:[[[EVEMetricsItemRegion alloc] initWithDictionary:dic] autorelease]];
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


@implementation EVEMetricsItem
@synthesize items;

+ (id) itemWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr {
	return [[[EVEMetricsItem alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs minQuantity:minQuantity apiKey:apiKey error:errorPtr] autorelease];
}

+ (id) itemWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEMetricsItem alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs minQuantity:minQuantity apiKey:apiKey target:target action:action object:aObject] autorelease];
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://eve-metrics.com/api/item.json?key=%@&type_ids=%@%@%@",
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
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://eve-metrics.com/api/item.json?key=%@&type_ids=%@%@%@",
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
		[items addObject:[[[EVEMetricsItemInfo alloc] initWithDictionary:dic] autorelease]];
}

@end
