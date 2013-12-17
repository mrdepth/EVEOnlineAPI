//
//  EVECharacterInfo.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.12.12.
//
//

#import "EVECharacterInfo.h"

@implementation EVECharacterInfoEmploymentHistoryItem

+ (id) characterInfoEmploymentHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterInfoEmploymentHistoryItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.recordID = [[attributeDict valueForKey:@"recordID"] integerValue];
		self.corporationID = [[attributeDict valueForKey:@"recordID"] integerValue];
		self.startDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startDate"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.recordID forKey:@"recordID"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.startDate forKey:@"startDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.recordID = [aDecoder decodeIntegerForKey:@"recordID"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterInfo

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) characterInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharacterInfo alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) aCharacterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSURL* url;
	if (keyID && vCode)
		url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterInfo.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], aCharacterID]];
	else
		url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterInfo.xml.aspx?characterID=%d", EVEOnlineAPIHost, aCharacterID]];

	if (self = [super initWithURL:url
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"employmentHistory"])
		return self.employmentHistory = [NSMutableArray array];
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"employmentHistory"])
		[(NSMutableArray*) self.employmentHistory addObject:[EVECharacterInfoEmploymentHistoryItem characterInfoEmploymentHistoryItemWithXMLAttributes:attributeDict]];
	return nil;
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"characterID"])
		self.characterID = [self.text integerValue];
	else if ([elementName isEqualToString:@"characterName"])
		self.characterName = self.text;
	else if ([elementName isEqualToString:@"race"])
		self.race = self.text;
	else if ([elementName isEqualToString:@"bloodline"])
		self.bloodline = self.text;
	else if ([elementName isEqualToString:@"accountBalance"])
		self.accountBalance = [self.text floatValue];
	else if ([elementName isEqualToString:@"skillPoints"])
		self.skillPoints = [self.text integerValue];
	else if ([elementName isEqualToString:@"shipName"])
		self.shipName = self.text;
	else if ([elementName isEqualToString:@"shipTypeID"])
		self.shipTypeID = [self.text integerValue];
	else if ([elementName isEqualToString:@"shipTypeName"])
		self.shipTypeName = self.text;
	else if ([elementName isEqualToString:@"corporationID"])
		self.corporationID = [self.text integerValue];
	else if ([elementName isEqualToString:@"corporation"])
		self.corporation = self.text;
	else if ([elementName isEqualToString:@"corporationDate"])
		self.corporationDate = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"allianceID"])
		self.allianceID = [self.text integerValue];
	else if ([elementName isEqualToString:@"alliance"])
		self.alliance = self.text;
	else if ([elementName isEqualToString:@"allianceDate"])
		self.allianceDate = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"lastKnownLocation"])
		self.lastKnownLocation = self.text;
	else if ([elementName isEqualToString:@"securityStatus"])
		self.securityStatus = [self.text floatValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeObject:self.race forKey:@"race"];
	[aCoder encodeObject:self.bloodline forKey:@"bloodline"];
	[aCoder encodeFloat:self.accountBalance forKey:@"accountBalance"];
	[aCoder encodeInteger:self.skillPoints forKey:@"skillPoints"];
	[aCoder encodeObject:self.shipName forKey:@"shipName"];
	[aCoder encodeInteger:self.shipTypeID forKey:@"shipTypeID"];
	[aCoder encodeObject:self.shipTypeName forKey:@"shipTypeName"];
	[aCoder encodeObject:self.corporation forKey:@"corporation"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.alliance forKey:@"alliance"];
	[aCoder encodeInteger:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.allianceDate forKey:@"allianceDate"];
	[aCoder encodeObject:self.lastKnownLocation forKey:@"lastKnownLocation"];
	[aCoder encodeFloat:self.securityStatus forKey:@"securityStatus"];
	[aCoder encodeObject:self.employmentHistory forKey:@"employmentHistory"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.race = [aDecoder decodeObjectForKey:@"race"];
		self.bloodline = [aDecoder decodeObjectForKey:@"bloodline"];
		self.accountBalance = [aDecoder decodeFloatForKey:@"accountBalance"];
		self.skillPoints = [aDecoder decodeIntegerForKey:@"skillPoints"];
		self.shipName = [aDecoder decodeObjectForKey:@"shipName"];
		self.shipTypeID = [aDecoder decodeIntegerForKey:@"shipTypeID"];
		self.shipTypeName = [aDecoder decodeObjectForKey:@"shipTypeName"];
		self.corporation = [aDecoder decodeObjectForKey:@"corporation"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.alliance = [aDecoder decodeObjectForKey:@"alliance"];
		self.allianceID = [aDecoder decodeIntegerForKey:@"allianceID"];
		self.allianceDate = [aDecoder decodeObjectForKey:@"allianceDate"];
		self.lastKnownLocation = [aDecoder decodeObjectForKey:@"lastKnownLocation"];
		self.securityStatus = [aDecoder decodeFloatForKey:@"securityStatus"];
		self.employmentHistory = [aDecoder decodeObjectForKey:@"employmentHistory"];
	}
	return self;
}

@end

