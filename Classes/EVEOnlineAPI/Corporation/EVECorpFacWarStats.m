//
//  EVECorpFacWarStats.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpFacWarStats.h"


@implementation EVECorpFacWarStats
@synthesize factionID;
@synthesize factionName;
@synthesize enlisted;
@synthesize pilots;
@synthesize killsYesterday;
@synthesize killsLastWeek;
@synthesize killsTotal;
@synthesize victoryPointsYesterday;
@synthesize victoryPointsLastWeek;
@synthesize victoryPointsTotal;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) corpFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVECorpFacWarStats alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) corpFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECorpFacWarStats alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/FacWarStats.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/FacWarStats.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[factionName release];
	[enlisted release];
	[super dealloc];
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
		self.enlisted = [[NSDateFormatter eveDateFormatter] dateFromString:text];
	}
	else if ([elementName isEqualToString:@"pilots"])
		self.pilots = [self.text integerValue];
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
@end
