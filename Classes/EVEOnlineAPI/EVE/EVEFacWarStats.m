//
//  EVEFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarStats.h"

@implementation EVEFacWarStatsTotals
@end


@implementation EVEFacWarStatsFactionsItem

+ (id) facWarStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarStatsFactionsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.pilots = [[attributeDict valueForKey:@"pilots"] integerValue];
		self.systemsControlled = [[attributeDict valueForKey:@"systemsControlled"] integerValue];
		self.killsYesterday = [[attributeDict valueForKey:@"killsYesterday"] integerValue];
		self.killsLastWeek = [[attributeDict valueForKey:@"killsLastWeek"] integerValue];
		self.killsTotal = [[attributeDict valueForKey:@"killsTotal"] integerValue];
		self.victoryPointsYesterday = [[attributeDict valueForKey:@"victoryPointsYesterday"] integerValue];
		self.victoryPointsLastWeek = [[attributeDict valueForKey:@"victoryPointsLastWeek"] integerValue];
		self.victoryPointsTotal = [[attributeDict valueForKey:@"victoryPointsTotal"] integerValue];
	}
	return self;
}

@end


@implementation EVEFacWarStatsFactionWarsItem

+ (id) facWarStatsFactionWarsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarStatsFactionWarsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.againstID = [[attributeDict valueForKey:@"againstID"] integerValue];
		self.againstName = [attributeDict valueForKey:@"againstName"];
	}
	return self;
}

@end


@implementation EVEFacWarStats

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarStatsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEFacWarStats alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/FacWarStats.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"factions"]) {
		self.factions = [[NSMutableArray alloc] init];
		return self.factions;
	}
	else if ([rowset isEqualToString:@"factionWars"]) {
		self.factionWars = [[NSMutableArray alloc] init];
		return self.factionWars;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"factions"]) {
		EVEFacWarStatsFactionsItem *facWarStatsFactionsItem = [EVEFacWarStatsFactionsItem facWarStatsFactionsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarStatsFactionsItem];
		return facWarStatsFactionsItem;
	}
	else if ([rowset isEqualToString:@"factionWars"]) {
		EVEFacWarStatsFactionWarsItem *facWarStatsFactionWarsItem = [EVEFacWarStatsFactionWarsItem facWarStatsFactionWarsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarStatsFactionWarsItem];
		return facWarStatsFactionWarsItem;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"totals"])
		self.totals = [[EVEFacWarStatsTotals alloc] init];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"killsYesterday"])
		self.totals.killsYesterday = [self.text integerValue];
	else if ([elementName isEqualToString:@"killsLastWeek"])
		self.totals.killsLastWeek = [self.text integerValue];
	else if ([elementName isEqualToString:@"killsTotal"])
		self.totals.killsTotal = [self.text integerValue];
	else if ([elementName isEqualToString:@"victoryPointsYesterday"])
		self.totals.victoryPointsYesterday = [self.text integerValue];
	else if ([elementName isEqualToString:@"victoryPointsLastWeek"])
		self.totals.victoryPointsLastWeek = [self.text integerValue];
	else if ([elementName isEqualToString:@"victoryPointsTotal"])
		self.totals.victoryPointsTotal = [self.text integerValue];
}
@end