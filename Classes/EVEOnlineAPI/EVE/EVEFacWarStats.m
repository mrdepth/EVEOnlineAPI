//
//  EVEFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarStats.h"

@implementation EVEFacWarStatsTotals

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeInt32:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeInt32:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeInt32:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeInt32:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeInt32:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.killsYesterday = [aDecoder decodeInt32ForKey:@"killsYesterday"];
		self.killsLastWeek = [aDecoder decodeInt32ForKey:@"killsLastWeek"];
		self.killsTotal = [aDecoder decodeInt32ForKey:@"killsTotal"];
		self.victoryPointsYesterday = [aDecoder decodeInt32ForKey:@"victoryPointsYesterday"];
		self.victoryPointsLastWeek = [aDecoder decodeInt32ForKey:@"victoryPointsLastWeek"];
		self.victoryPointsTotal = [aDecoder decodeInt32ForKey:@"victoryPointsTotal"];
	}
	return self;
}

@end


@implementation EVEFacWarStatsFactionsItem

+ (id) facWarStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarStatsFactionsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.factionID = [[attributeDict valueForKey:@"factionID"] intValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.pilots = [[attributeDict valueForKey:@"pilots"] intValue];
		self.systemsControlled = [[attributeDict valueForKey:@"systemsControlled"] intValue];
		self.killsYesterday = [[attributeDict valueForKey:@"killsYesterday"] intValue];
		self.killsLastWeek = [[attributeDict valueForKey:@"killsLastWeek"] intValue];
		self.killsTotal = [[attributeDict valueForKey:@"killsTotal"] intValue];
		self.victoryPointsYesterday = [[attributeDict valueForKey:@"victoryPointsYesterday"] intValue];
		self.victoryPointsLastWeek = [[attributeDict valueForKey:@"victoryPointsLastWeek"] intValue];
		self.victoryPointsTotal = [[attributeDict valueForKey:@"victoryPointsTotal"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInt32:self.pilots forKey:@"pilots"];
	[aCoder encodeInt32:self.systemsControlled forKey:@"systemsControlled"];
	[aCoder encodeInt32:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeInt32:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeInt32:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeInt32:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeInt32:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeInt32:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.factionID = [aDecoder decodeInt32ForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.pilots = [aDecoder decodeInt32ForKey:@"pilots"];
		self.systemsControlled = [aDecoder decodeInt32ForKey:@"systemsControlled"];
		self.killsYesterday = [aDecoder decodeInt32ForKey:@"killsYesterday"];
		self.killsLastWeek = [aDecoder decodeInt32ForKey:@"killsLastWeek"];
		self.killsTotal = [aDecoder decodeInt32ForKey:@"killsTotal"];
		self.victoryPointsYesterday = [aDecoder decodeInt32ForKey:@"victoryPointsYesterday"];
		self.victoryPointsLastWeek = [aDecoder decodeInt32ForKey:@"victoryPointsLastWeek"];
		self.victoryPointsTotal = [aDecoder decodeInt32ForKey:@"victoryPointsTotal"];
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
		self.factionID = [[attributeDict valueForKey:@"factionID"] intValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.againstID = [[attributeDict valueForKey:@"againstID"] intValue];
		self.againstName = [attributeDict valueForKey:@"againstName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInt32:self.againstID forKey:@"againstID"];
	[aCoder encodeObject:self.againstName forKey:@"againstName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.factionID = [aDecoder decodeInt32ForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.againstID = [aDecoder decodeInt32ForKey:@"againstID"];
		self.againstName = [aDecoder decodeObjectForKey:@"againstName"];
	}
	return self;
}

@end


@implementation EVEFacWarStats

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarStatsWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEFacWarStats alloc] initWithCachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/FacWarStats.xml.aspx", EVEOnlineAPIHost]]
					   cachePolicy:cachePolicy
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
		self.totals.killsYesterday = [self.text intValue];
	else if ([elementName isEqualToString:@"killsLastWeek"])
		self.totals.killsLastWeek = [self.text intValue];
	else if ([elementName isEqualToString:@"killsTotal"])
		self.totals.killsTotal = [self.text intValue];
	else if ([elementName isEqualToString:@"victoryPointsYesterday"])
		self.totals.victoryPointsYesterday = [self.text intValue];
	else if ([elementName isEqualToString:@"victoryPointsLastWeek"])
		self.totals.victoryPointsLastWeek = [self.text intValue];
	else if ([elementName isEqualToString:@"victoryPointsTotal"])
		self.totals.victoryPointsTotal = [self.text intValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.totals forKey:@"totals"];
	[aCoder encodeObject:self.factions forKey:@"factions"];
	[aCoder encodeObject:self.factionWars forKey:@"factionWars"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.totals = [aDecoder decodeObjectForKey:@"totals"];
		self.factions = [aDecoder decodeObjectForKey:@"factions"];
		self.factionWars = [aDecoder decodeObjectForKey:@"factionWars"];
	}
	return self;
}

@end