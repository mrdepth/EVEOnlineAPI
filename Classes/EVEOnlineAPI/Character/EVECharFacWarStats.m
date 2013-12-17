//
//  EVECharFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharFacWarStats.h"


@implementation EVECharFacWarStats

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharFacWarStats alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/FacWarStats.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"factionID"])
		self.factionID = [self.text integerValue];
	else if ([elementName isEqualToString:@"factionName"])
		self.factionName = self.text;
	else if ([elementName isEqualToString:@"enlisted"]) {
		self.enlisted = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	}
	else if ([elementName isEqualToString:@"currentRank"])
		self.currentRank = [self.text integerValue];
	else if ([elementName isEqualToString:@"highestRank"])
		self.highestRank = [self.text integerValue];
	else if ([elementName isEqualToString:@"killsYesterday"])
		self.killsYesterday = [self.text integerValue];
	else if ([elementName isEqualToString:@"killsLastWeek"])
		self.killsLastWeek = [self.text integerValue];
	else if ([elementName isEqualToString:@"killsTotal"])
		self.killsTotal = [self.text integerValue];
	else if ([elementName isEqualToString:@"victoryPointsYesterday"])
		self.victoryPointsYesterday = [self.text integerValue];
	else if ([elementName isEqualToString:@"victoryPointsLastWeek"])
		self.victoryPointsLastWeek = [self.text integerValue];
	else if ([elementName isEqualToString:@"victoryPointsTotal"])
		self.victoryPointsTotal = [self.text integerValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInteger:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeObject:self.enlisted forKey:@"enlisted"];
	[aCoder encodeInteger:self.currentRank forKey:@"currentRank"];
	[aCoder encodeInteger:self.highestRank forKey:@"highestRank"];
	[aCoder encodeInteger:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeInteger:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeInteger:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeInteger:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeInteger:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeInteger:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.factionID = [aDecoder decodeIntegerForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.enlisted = [aDecoder decodeObjectForKey:@"enlisted"];
		self.currentRank = [aDecoder decodeIntegerForKey:@"currentRank"];
		self.highestRank = [aDecoder decodeIntegerForKey:@"highestRank"];
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
