//
//  EVEFacWarTopStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarTopStats.h"


@implementation EVEFacWarTopStatsCharactersItem
@synthesize characterID;
@synthesize characterName;
@synthesize kills;

+ (id) facWarTopStatsCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEFacWarTopStatsCharactersItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.kills = [[attributeDict valueForKey:@"kills"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[characterName release];
	[super dealloc];
}

@end


@implementation EVEFacWarTopStatsCorporationsItem
@synthesize corporationID;
@synthesize corporationName;
@synthesize kills;

+ (id) facWarTopStatsCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEFacWarTopStatsCorporationsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.kills = [[attributeDict valueForKey:@"kills"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[corporationName release];
	[super dealloc];
}

@end


@implementation EVEFacWarTopStatsFactionsItem
@synthesize factionID;
@synthesize factionName;
@synthesize kills;

+ (id) facWarTopStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEFacWarTopStatsFactionsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.kills = [[attributeDict valueForKey:@"kills"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[factionName release];
	[super dealloc];
}

@end

@implementation EVEFacWarTopStatsSection
@synthesize killsYesterday;
@synthesize killsLastWeek;
@synthesize killsTotal;
@synthesize victoryPointsYesterday;
@synthesize victoryPointsLastWeek;
@synthesize victoryPointsTotal;

- (void) dealloc {
	[killsYesterday release];
	[killsLastWeek release];
	[killsTotal release];
	[victoryPointsYesterday release];
	[victoryPointsLastWeek release];
	[victoryPointsTotal release];
	[super dealloc];
}

@end


@implementation EVEFacWarTopStats
@synthesize characters;
@synthesize corporations;
@synthesize factions;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarTopStatsWithError:(NSError **)errorPtr {
	return [[[EVEFacWarTopStats alloc] initWithError:errorPtr] autorelease];
}

+ (id) facWarTopStatsWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEFacWarTopStats alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ErrorList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ErrorList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[characters release];
	[corporations release];
	[factions release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"KillsYesterday"]) {
		NSMutableArray *stats = [[[NSMutableArray alloc] init] autorelease];
		[currentSection setKillsYesterday:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"KillsLastWeek"]) {
		NSMutableArray *stats = [[[NSMutableArray alloc] init] autorelease];
		[currentSection setKillsLastWeek:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"KillsTotal"]) {
		NSMutableArray *stats = [[[NSMutableArray alloc] init] autorelease];
		[currentSection setKillsTotal:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"VictoryPointsYesterday"]) {
		NSMutableArray *stats = [[[NSMutableArray alloc] init] autorelease];
		[currentSection setVictoryPointsYesterday:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"VictoryPointsLastWeek"]) {
		NSMutableArray *stats = [[[NSMutableArray alloc] init] autorelease];
		[currentSection setVictoryPointsLastWeek:stats];
		return stats;
	}
	else if ([rowset isEqualToString:@"VictoryPointsTotal"]) {
		NSMutableArray *stats = [[[NSMutableArray alloc] init] autorelease];
		[currentSection setVictoryPointsTotal:stats];
		return stats;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if (currentSection == characters) {
		EVEFacWarTopStatsCharactersItem *facWarTopStatsCharactersItem = [EVEFacWarTopStatsCharactersItem facWarTopStatsCharactersItemWithXMLAttributes:attributeDict];
		[object addObject:facWarTopStatsCharactersItem];
		return facWarTopStatsCharactersItem;
	}
	else if (currentSection == corporations) {
		EVEFacWarTopStatsCorporationsItem *facWarTopStatsCorporationsItem = [EVEFacWarTopStatsCorporationsItem facWarTopStatsCorporationsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarTopStatsCorporationsItem];
		return facWarTopStatsCorporationsItem;
	}
	else if (currentSection == factions) {
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
		self.characters = currentSection = [[[EVEFacWarTopStatsSection alloc] init] autorelease];
	else if ([elementName isEqualToString:@"corporations"])
		self.corporations = currentSection = [[[EVEFacWarTopStatsSection alloc] init] autorelease];
	else if ([elementName isEqualToString:@"factions"])
		self.factions = currentSection = [[[EVEFacWarTopStatsSection alloc] init] autorelease];
}

@end