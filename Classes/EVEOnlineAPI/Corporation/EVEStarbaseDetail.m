//
//  EVEStarbaseDetail.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStarbaseDetail.h"


@implementation EVEStarbaseDetailGeneralSettings
@end

@implementation EVEStarbaseDetailCombatSettings
@end


@implementation EVEStarbaseDetailFuelItem

+ (id) starbaseDetailFuelItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEStarbaseDetailFuelItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] integerValue];
	}
	return self;
}
@end


@implementation EVEStarbaseDetail

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) starbaseDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEStarbaseDetail alloc] initWithKeyID:keyID vCode:vCode characterID:characterID itemID:itemID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/StarbaseDetail.xml.aspx?keyID=%d&vCode=%@&characterID=%d&itemID=%qi&version=2", EVEOnlineAPIHost, keyID, vCode, characterID, itemID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"fuel"]) {
		self.fuel = [[NSMutableArray alloc] init];
		return self.fuel;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"fuel"]) {
		EVEStarbaseDetailFuelItem *starbaseDetailFuelItem = [EVEStarbaseDetailFuelItem starbaseDetailFuelItemWithXMLAttributes:attributeDict];
		[object addObject:starbaseDetailFuelItem];
		return starbaseDetailFuelItem;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"generalSettings"])
		self.generalSettings = [[EVEStarbaseDetailGeneralSettings alloc] init];
	else if ([elementName isEqualToString:@"combatSettings"])
		self.combatSettings = [[EVEStarbaseDetailCombatSettings alloc] init];
	else if ([elementName isEqualToString:@"useStandingsFrom"])
		self.combatSettings.useStandingsFromOwnerID = [[attributeDict valueForKey:@"ownerID"] integerValue];
	else if ([elementName isEqualToString:@"onStandingDrop"])
		self.combatSettings.onStandingDropStading = [[attributeDict valueForKey:@"standing"] integerValue];
	else if ([elementName isEqualToString:@"onStatusDrop"]) {
		self.combatSettings.onStatusDropEnabled = (BOOL) [[attributeDict valueForKey:@"enabled"] integerValue];
		self.combatSettings.onStatusDropStanding = [[attributeDict valueForKey:@"standing"] integerValue];
	}
	else if ([elementName isEqualToString:@"onAggression"])
		self.combatSettings.onAggressionEnabled = (BOOL) [[attributeDict valueForKey:@"enabled"] integerValue];
	else if ([elementName isEqualToString:@"onCorporationWar"])
		self.combatSettings.onCorporationWarEnabled = (BOOL) [[attributeDict valueForKey:@"enabled"] integerValue];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"state"])
		self.state = [self.text integerValue];
	else if ([elementName isEqualToString:@"corporationName"])
		self.stateTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"onlineTimestamp"])
		self.onlineTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"usageFlags"])
		self.generalSettings.usageFlags = [self.text integerValue];
	else if ([elementName isEqualToString:@"deployFlags"])
		self.generalSettings.deployFlags = [self.text integerValue];
	else if ([elementName isEqualToString:@"allowCorporationMembers"])
		self.generalSettings.allowCorporationMembers = (BOOL) [self.text integerValue];
	else if ([elementName isEqualToString:@"allowAllianceMembers"])
		self.generalSettings.allowAllianceMembers = (BOOL) [self.text integerValue];
}

@end
