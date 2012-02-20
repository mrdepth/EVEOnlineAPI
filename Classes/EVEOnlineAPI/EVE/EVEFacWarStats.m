//
//  EVEFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarStats.h"

@implementation EVEFacWarStatsTotals
@synthesize killsYesterday;
@synthesize killsLastWeek;
@synthesize killsTotal;
@synthesize victoryPointsYesterday;
@synthesize victoryPointsLastWeek;
@synthesize victoryPointsTotal;
@end


@implementation EVEFacWarStatsFactionsItem
@synthesize factionID;
@synthesize factionName;
@synthesize pilots;
@synthesize systemsControlled;
@synthesize killsYesterday;
@synthesize killsLastWeek;
@synthesize killsTotal;
@synthesize victoryPointsYesterday;
@synthesize victoryPointsLastWeek;
@synthesize victoryPointsTotal;

+ (id) facWarStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEFacWarStatsFactionsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[factionName release];
	[super dealloc];
}

@end


@implementation EVEFacWarStatsFactionWarsItem
@synthesize factionID;
@synthesize factionName;
@synthesize againstID;
@synthesize againstName;

+ (id) facWarStatsFactionWarsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEFacWarStatsFactionWarsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[factionName release];
	[againstName release];
	[super dealloc];
}

@end


@implementation EVEFacWarStats
@synthesize totals;
@synthesize factions;
@synthesize factionWars;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarStatsWithError:(NSError **)errorPtr {
	return [[[EVEFacWarStats alloc] initWithError:errorPtr] autorelease];
}

+ (id) facWarStatsWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEFacWarStats alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/FacWarStats.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/FacWarStats.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[totals release];
	[factions release];
	[factionWars release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"factions"]) {
		factions = [[NSMutableArray alloc] init];
		return factions;
	}
	else if ([rowset isEqualToString:@"factionWars"]) {
		factionWars = [[NSMutableArray alloc] init];
		return factionWars;
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
		self.totals = [[[EVEFacWarStatsTotals alloc] init] autorelease];
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