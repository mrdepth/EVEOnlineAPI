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
	[aCoder encodeInteger:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeInteger:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeInteger:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeInteger:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeInteger:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeInteger:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.killsYesterday = [aDecoder decodeIntegerForKey:@"killsYesterday"];
		self.killsLastWeek = [aDecoder decodeIntegerForKey:@"killsLastWeek"];
		self.killsTotal = [aDecoder decodeIntegerForKey:@"killsTotal"];
		self.victoryPointsYesterday = [aDecoder decodeIntegerForKey:@"victoryPointsYesterday"];
		self.victoryPointsLastWeek = [aDecoder decodeIntegerForKey:@"victoryPointsLastWeek"];
		self.victoryPointsTotal = [aDecoder decodeIntegerForKey:@"victoryPointsTotal"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInteger:self.pilots forKey:@"pilots"];
	[aCoder encodeInteger:self.systemsControlled forKey:@"systemsControlled"];
	[aCoder encodeInteger:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeInteger:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeInteger:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeInteger:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeInteger:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeInteger:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.factionID = [aDecoder decodeIntegerForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.pilots = [aDecoder decodeIntegerForKey:@"pilots"];
		self.systemsControlled = [aDecoder decodeIntegerForKey:@"systemsControlled"];
		self.killsYesterday = [aDecoder decodeIntegerForKey:@"killsYesterday"];
		self.killsLastWeek = [aDecoder decodeIntegerForKey:@"killsLastWeek"];
		self.killsTotal = [aDecoder decodeIntegerForKey:@"killsTotal"];
		self.victoryPointsYesterday = [aDecoder decodeIntegerForKey:@"victoryPointsYesterday"];
		self.victoryPointsLastWeek = [aDecoder decodeIntegerForKey:@"victoryPointsLastWeek"];
		self.victoryPointsTotal = [aDecoder decodeIntegerForKey:@"victoryPointsTotal"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInteger:self.againstID forKey:@"againstID"];
	[aCoder encodeObject:self.againstName forKey:@"againstName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.factionID = [aDecoder decodeIntegerForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.againstID = [aDecoder decodeIntegerForKey:@"againstID"];
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