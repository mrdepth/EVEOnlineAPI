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

@end

@implementation EVEFacWarTopStatsSection
@end


@implementation EVEFacWarTopStats

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarTopStatsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEFacWarTopStats alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
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

@end