//
//  EVEStarbaseDetail.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStarbaseDetail.h"


@implementation EVEStarbaseDetailGeneralSettings
#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.usageFlags forKey:@"usageFlags"];
	[aCoder encodeInt32:self.deployFlags forKey:@"deployFlags"];
	[aCoder encodeBool:self.allowCorporationMembers forKey:@"allowCorporationMembers"];
	[aCoder encodeBool:self.allowAllianceMembers forKey:@"allowAllianceMembers"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.usageFlags = [aDecoder decodeInt32ForKey:@"usageFlags"];
		self.deployFlags = [aDecoder decodeInt32ForKey:@"deployFlags"];
		self.allowCorporationMembers = [aDecoder decodeBoolForKey:@"allowCorporationMembers"];
		self.allowAllianceMembers = [aDecoder decodeBoolForKey:@"allowAllianceMembers"];
	}
	return self;
}

@end

@implementation EVEStarbaseDetailCombatSettings

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.useStandingsFromOwnerID forKey:@"useStandingsFromOwnerID"];
	[aCoder encodeInt32:self.onStandingDropStading forKey:@"onStandingDropStading"];
	[aCoder encodeBool:self.onStatusDropEnabled forKey:@"onStatusDropEnabled"];
	[aCoder encodeInt32:self.onStatusDropStanding forKey:@"onStatusDropStanding"];
	[aCoder encodeBool:self.onAggressionEnabled forKey:@"onAggressionEnabled"];
	[aCoder encodeInt32:self.onCorporationWarEnabled forKey:@"onCorporationWarEnabled"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.useStandingsFromOwnerID = [aDecoder decodeInt32ForKey:@"useStandingsFromOwnerID"];
		self.onStandingDropStading = [aDecoder decodeInt32ForKey:@"onStandingDropStading"];
		self.onStatusDropEnabled = [aDecoder decodeBoolForKey:@"onStatusDropEnabled"];
		self.onStatusDropStanding = [aDecoder decodeInt32ForKey:@"onStatusDropStanding"];
		self.onAggressionEnabled = [aDecoder decodeBoolForKey:@"onAggressionEnabled"];
		self.onCorporationWarEnabled = [aDecoder decodeInt32ForKey:@"onCorporationWarEnabled"];
	}
	return self;
}

@end


@implementation EVEStarbaseDetailFuelItem

+ (id) starbaseDetailFuelItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEStarbaseDetailFuelItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.quantity forKey:@"quantity"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.quantity = [aDecoder decodeInt32ForKey:@"quantity"];
	}
	return self;
}

@end


@implementation EVEStarbaseDetail

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) starbaseDetailWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID: (int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEStarbaseDetail alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID itemID:itemID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID: (int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/StarbaseDetail.xml.aspx?keyID=%d&vCode=%@&characterID=%d&itemID=%qi&version=2", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, itemID]]
					   cachePolicy:cachePolicy
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
		self.combatSettings.useStandingsFromOwnerID = [[attributeDict valueForKey:@"ownerID"] intValue];
	else if ([elementName isEqualToString:@"onStandingDrop"])
		self.combatSettings.onStandingDropStading = [[attributeDict valueForKey:@"standing"] intValue];
	else if ([elementName isEqualToString:@"onStatusDrop"]) {
		self.combatSettings.onStatusDropEnabled = (BOOL) [[attributeDict valueForKey:@"enabled"] intValue];
		self.combatSettings.onStatusDropStanding = [[attributeDict valueForKey:@"standing"] intValue];
	}
	else if ([elementName isEqualToString:@"onAggression"])
		self.combatSettings.onAggressionEnabled = (BOOL) [[attributeDict valueForKey:@"enabled"] intValue];
	else if ([elementName isEqualToString:@"onCorporationWar"])
		self.combatSettings.onCorporationWarEnabled = (BOOL) [[attributeDict valueForKey:@"enabled"] intValue];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"state"])
		self.state = [self.text intValue];
	else if ([elementName isEqualToString:@"corporationName"])
		self.stateTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"onlineTimestamp"])
		self.onlineTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"usageFlags"])
		self.generalSettings.usageFlags = [self.text intValue];
	else if ([elementName isEqualToString:@"deployFlags"])
		self.generalSettings.deployFlags = [self.text intValue];
	else if ([elementName isEqualToString:@"allowCorporationMembers"])
		self.generalSettings.allowCorporationMembers = (BOOL) [self.text intValue];
	else if ([elementName isEqualToString:@"allowAllianceMembers"])
		self.generalSettings.allowAllianceMembers = (BOOL) [self.text intValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInt32:self.state forKey:@"state"];
	[aCoder encodeObject:self.stateTimestamp forKey:@"stateTimestamp"];
	[aCoder encodeObject:self.onlineTimestamp forKey:@"onlineTimestamp"];
	[aCoder encodeObject:self.generalSettings forKey:@"generalSettings"];
	[aCoder encodeObject:self.combatSettings forKey:@"combatSettings"];
	[aCoder encodeObject:self.fuel forKey:@"fuel"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.state = [aDecoder decodeInt32ForKey:@"state"];
		self.stateTimestamp = [aDecoder decodeObjectForKey:@"stateTimestamp"];
		self.onlineTimestamp = [aDecoder decodeObjectForKey:@"onlineTimestamp"];
		self.generalSettings = [aDecoder decodeObjectForKey:@"generalSettings"];
		self.combatSettings = [aDecoder decodeObjectForKey:@"combatSettings"];
		self.fuel = [aDecoder decodeObjectForKey:@"fuel"];
	}
	return self;
}

@end
