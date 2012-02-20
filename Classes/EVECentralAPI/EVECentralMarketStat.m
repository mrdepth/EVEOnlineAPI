//
//  EVECentralMarketStat.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralMarketStat.h"

@implementation EVECentralMarketStatTypeStat
@synthesize volume;
@synthesize avg;
@synthesize max;
@synthesize min;
@synthesize stddev;
@synthesize median;

+ (id) marketStatTypeStat {
	return [[[EVECentralMarketStatTypeStat alloc] init] autorelease];
}

@end

@implementation EVECentralMarketStatType
@synthesize typeID;
@synthesize all;
@synthesize buy;
@synthesize sell;

+ (id) marketStatTypeStatWithDictionary: (NSDictionary*) dictionary {
	return [[[EVECentralMarketStatType alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.typeID = [[dictionary valueForKey:@"id"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[all release];
	[buy release];
	[sell release];
	[super dealloc];
}

@end



@implementation EVECentralMarketStat(Private)

- (NSString*) argumentsStringWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ {
	NSMutableArray *typeIDsArgs = [NSMutableArray array];
	NSMutableArray *regionIDsArgs = [NSMutableArray array];
	
	for (NSNumber *typeID in typeIDs)
		[typeIDsArgs addObject:[NSString stringWithFormat:@"typeid=%@", typeID]];
	
	for (NSNumber *regionID in regionIDs)
		[regionIDsArgs addObject:[NSString stringWithFormat:@"regionlimit=%@", regionID]];
	
	NSMutableString *argumentsString = [NSMutableString string];
	[argumentsString appendString:[typeIDsArgs componentsJoinedByString:@"&"]];
	
	if (regionIDsArgs.count > 0)
		[argumentsString appendFormat:@"&%@", [regionIDsArgs componentsJoinedByString:@"&"]];
	
	if (hours)
		[argumentsString appendFormat:@"&hours=%d", hours];
	
	if (minQ)
		[argumentsString appendFormat:@"&minQ=%d", minQ];
	
	return argumentsString;
}

@end


@implementation EVECentralMarketStat
@synthesize types;

+ (id) marketStatWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr {
	return [[[EVECentralMarketStat alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs hours:hours minQ:minQ error:errorPtr] autorelease];
}

+ (id) marketStatWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVECentralMarketStat alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs hours:hours minQ:minQ target:target action:action object:aObject] autorelease];
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/marketstat?%@",
														EVECentralAPIHost,
														[self argumentsStringWithTypeIDs:typeIDs regionIDs:regionIDs hours:hours minQ:minQ]]]
											cacheStyle:EVERequestCacheStyleModifiedShort
												 error:errorPtr]) {
	}
	return self;
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/marketstat?%@",
														EVECentralAPIHost,
														[self argumentsStringWithTypeIDs:typeIDs regionIDs:regionIDs hours:hours minQ:minQ]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[types release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	
	if ([elementName isEqualToString:@"marketstat"])
		self.types = [NSMutableArray array];
	else if ([elementName isEqualToString:@"type"]) {
		currentType = [EVECentralMarketStatType marketStatTypeStatWithDictionary:attributeDict];
		[types addObject:currentType];
	}
	else if ([elementName isEqualToString:@"all"]) {
		currentStat = [EVECentralMarketStatTypeStat marketStatTypeStat];
		currentType.all = currentStat;
	}
	else if ([elementName isEqualToString:@"buy"]) {
		currentStat = [EVECentralMarketStatTypeStat marketStatTypeStat];
		currentType.buy = currentStat;
	}
	else if ([elementName isEqualToString:@"sell"]) {
		currentStat = [EVECentralMarketStatTypeStat marketStatTypeStat];
		currentType.sell = currentStat;
	}
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"volume"])
		currentStat.volume = [self.text floatValue];
	else if ([elementName isEqualToString:@"avg"])
		currentStat.avg = [self.text floatValue];
	else if ([elementName isEqualToString:@"max"])
		currentStat.max = [self.text floatValue];
	else if ([elementName isEqualToString:@"min"])
		currentStat.min = [self.text floatValue];
	else if ([elementName isEqualToString:@"stddev"])
		currentStat.stddev = [self.text floatValue];
	else if ([elementName isEqualToString:@"median"])
		currentStat.median = [self.text floatValue];
		
}

@end
