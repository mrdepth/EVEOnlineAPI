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

+ (id) charFacWarStatsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharFacWarStats alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/FacWarStats.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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
		self.factionID = [self.text intValue];
	else if ([elementName isEqualToString:@"factionName"])
		self.factionName = self.text;
	else if ([elementName isEqualToString:@"enlisted"]) {
		self.enlisted = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	}
	else if ([elementName isEqualToString:@"currentRank"])
		self.currentRank = [self.text intValue];
	else if ([elementName isEqualToString:@"highestRank"])
		self.highestRank = [self.text intValue];
	else if ([elementName isEqualToString:@"killsYesterday"])
		self.killsYesterday = [self.text intValue];
	else if ([elementName isEqualToString:@"killsLastWeek"])
		self.killsLastWeek = [self.text intValue];
	else if ([elementName isEqualToString:@"killsTotal"])
		self.killsTotal = [self.text intValue];
	else if ([elementName isEqualToString:@"victoryPointsYesterday"])
		self.victoryPointsYesterday = [self.text intValue];
	else if ([elementName isEqualToString:@"victoryPointsLastWeek"])
		self.victoryPointsLastWeek = [self.text intValue];
	else if ([elementName isEqualToString:@"victoryPointsTotal"])
		self.victoryPointsTotal = [self.text intValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInt32:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeObject:self.enlisted forKey:@"enlisted"];
	[aCoder encodeInt32:self.currentRank forKey:@"currentRank"];
	[aCoder encodeInt32:self.highestRank forKey:@"highestRank"];
	[aCoder encodeInt32:self.killsYesterday forKey:@"killsYesterday"];
	[aCoder encodeInt32:self.killsLastWeek forKey:@"killsLastWeek"];
	[aCoder encodeInt32:self.killsTotal forKey:@"killsTotal"];
	[aCoder encodeInt32:self.victoryPointsYesterday forKey:@"victoryPointsYesterday"];
	[aCoder encodeInt32:self.victoryPointsLastWeek forKey:@"victoryPointsLastWeek"];
	[aCoder encodeInt32:self.victoryPointsTotal forKey:@"victoryPointsTotal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.factionID = [aDecoder decodeInt32ForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.enlisted = [aDecoder decodeObjectForKey:@"enlisted"];
		self.currentRank = [aDecoder decodeInt32ForKey:@"currentRank"];
		self.highestRank = [aDecoder decodeInt32ForKey:@"highestRank"];
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
