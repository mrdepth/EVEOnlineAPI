//
//  EVEFacWarTopStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarTopStats.h"

@interface EVEFacWarTopStats()
@property (nonatomic, strong) EVEFacWarTopStatsSection *currentSection;

@end

@implementation EVEFacWarTopStatsCharactersItem

+ (id) facWarTopStatsCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarTopStatsCharactersItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.kills = [[attributeDict valueForKey:@"kills"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInteger:self.kills forKey:@"kills"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.kills = [aDecoder decodeIntegerForKey:@"kills"];
	}
	return self;
}

@end


@implementation EVEFacWarTopStatsCorporationsItem

+ (id) facWarTopStatsCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarTopStatsCorporationsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.kills = [[attributeDict valueForKey:@"kills"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	[aCoder encodeInteger:self.kills forKey:@"kills"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		self.kills = [aDecoder decodeIntegerForKey:@"kills"];
	}
	return self;
}


@end


@implementation EVEFacWarTopStatsFactionsItem

+ (id) facWarTopStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarTopStatsFactionsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.kills = [[attributeDict valueForKey:@"kills"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInteger:self.kills forKey:@"kills"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.factionID = [aDecoder decodeIntegerForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.kills = [aDecoder decodeIntegerForKey:@"kills"];
	}
	return self;
}

@end

@implementation EVEFacWarTopStatsSection

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeObject:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeObject:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeObject:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeObject:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeObject:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.killsYesterday = [aDecoder decodeObjectForKey:@"killsYesterday"];
		self.killsLastWeek = [aDecoder decodeObjectForKey:@"killsLastWeek"];
		self.killsTotal = [aDecoder decodeObjectForKey:@"killsTotal"];
		self.victoryPointsYesterday = [aDecoder decodeObjectForKey:@"victoryPointsYesterday"];
		self.victoryPointsLastWeek = [aDecoder decodeObjectForKey:@"victoryPointsLastWeek"];
		self.victoryPointsTotal = [aDecoder decodeObjectForKey:@"victoryPointsTotal"];
	}
	return self;
}
@end


@implementation EVEFacWarTopStats

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarTopStatsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEFacWarTopStats alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ErrorList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"KillsYesterday"]) {
		NSMutableArray *stats = [[NSMutableArray alloc] init];
		[self.currentSection setKillsYesterday:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"KillsLastWeek"]) {
		NSMutableArray *stats = [[NSMutableArray alloc] init];
		[self.currentSection setKillsLastWeek:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"KillsTotal"]) {
		NSMutableArray *stats = [[NSMutableArray alloc] init];
		[self.currentSection setKillsTotal:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"VictoryPointsYesterday"]) {
		NSMutableArray *stats = [[NSMutableArray alloc] init];
		[self.currentSection setVictoryPointsYesterday:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"VictoryPointsLastWeek"]) {
		NSMutableArray *stats = [[NSMutableArray alloc] init];
		[self.currentSection setVictoryPointsLastWeek:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"VictoryPointsTotal"]) {
		NSMutableArray *stats = [[NSMutableArray alloc] init];
		[self.currentSection setVictoryPointsTotal:stats];
		return stats;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if (self.currentSection == self.characters) {
		EVEFacWarTopStatsCharactersItem *facWarTopStatsCharactersItem = [EVEFacWarTopStatsCharactersItem facWarTopStatsCharactersItemWithXMLAttributes:attributeDict];
		[object addObject:facWarTopStatsCharactersItem];
		return facWarTopStatsCharactersItem;
	}
	else if (self.currentSection == self.corporations) {
		EVEFacWarTopStatsCorporationsItem *facWarTopStatsCorporationsItem = [EVEFacWarTopStatsCorporationsItem facWarTopStatsCorporationsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarTopStatsCorporationsItem];
		return facWarTopStatsCorporationsItem;
	}
	else if (self.currentSection == self.factions) {
		EVEFacWarTopStatsFactionsItem *facWarTopStatsFactionsItem = [EVEFacWarTopStatsFactionsItem facWarTopStatsFactionsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarTopStatsFactionsItem];
		return facWarTopStatsFactionsItem;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"characters"])
		self.characters = self.currentSection = [[EVEFacWarTopStatsSection alloc] init];
	else if ([elementName isEqualToString:@"corporations"])
		self.corporations = self.currentSection = [[EVEFacWarTopStatsSection alloc] init];
	else if ([elementName isEqualToString:@"factions"])
		self.factions = self.currentSection = [[EVEFacWarTopStatsSection alloc] init];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.characters forKey:@"characters"];
	[aCoder encodeObject:self.corporations forKey:@"corporations"];
	[aCoder encodeObject:self.factions forKey:@"factions"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.characters= [aDecoder decodeObjectForKey:@"characters"];
		self.corporations = [aDecoder decodeObjectForKey:@"corporations"];
		self.factions = [aDecoder decodeObjectForKey:@"factions"];
	}
	return self;
}

@end