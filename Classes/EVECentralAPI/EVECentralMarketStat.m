//
//  EVECentralMarketStat.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralMarketStat.h"

@implementation EVECentralMarketStatTypeStat

+ (id) marketStatTypeStat {
	return [[EVECentralMarketStatTypeStat alloc] init];
}

@end

@implementation EVECentralMarketStatType

+ (id) marketStatTypeStatWithDictionary: (NSDictionary*) dictionary {
	return [[EVECentralMarketStatType alloc] initWithDictionary:dictionary];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		self.typeID = [[dictionary valueForKey:@"id"] integerValue];
	}
	return self;
}

@end



@interface EVECentralMarketStat()

@property(nonatomic, strong) EVECentralMarketStatType *currentType;
@property(nonatomic, strong) EVECentralMarketStatTypeStat *currentStat;

- (NSString*) argumentsStringWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ;

@end

@implementation EVECentralMarketStat

+ (id) marketStatWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECentralMarketStat alloc] initWithTypeIDs:typeIDs regionIDs:regionIDs hours:hours minQ:minQ error:errorPtr progressHandler:progressHandler];
}

- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/marketstat?%@",
														EVECentralAPIHost,
														[self argumentsStringWithTypeIDs:typeIDs regionIDs:regionIDs hours:hours minQ:minQ]]]
											cacheStyle:EVERequestCacheStyleModifiedShort
												 error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
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
		self.currentType = [EVECentralMarketStatType marketStatTypeStatWithDictionary:attributeDict];
		[(NSMutableArray*) self.types addObject:self.currentType];
	}
	else if ([elementName isEqualToString:@"all"]) {
		self.currentStat = [EVECentralMarketStatTypeStat marketStatTypeStat];
		self.currentType.all = self.currentStat;
	}
	else if ([elementName isEqualToString:@"buy"]) {
		self.currentStat = [EVECentralMarketStatTypeStat marketStatTypeStat];
		self.currentType.buy = self.currentStat;
	}
	else if ([elementName isEqualToString:@"sell"]) {
		self.currentStat = [EVECentralMarketStatTypeStat marketStatTypeStat];
		self.currentType.sell = self.currentStat;
	}
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"volume"])
		self.currentStat.volume = [self.validText floatValue];
	else if ([elementName isEqualToString:@"avg"])
		self.currentStat.avg = [self.validText floatValue];
	else if ([elementName isEqualToString:@"max"])
		self.currentStat.max = [self.validText floatValue];
	else if ([elementName isEqualToString:@"min"])
		self.currentStat.min = [self.validText floatValue];
	else if ([elementName isEqualToString:@"stddev"])
		self.currentStat.stddev = [self.validText floatValue];
	else if ([elementName isEqualToString:@"median"])
		self.currentStat.median = [self.validText floatValue];
		
}

#pragma mark - Private

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
