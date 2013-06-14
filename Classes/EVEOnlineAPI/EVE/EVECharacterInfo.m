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

@end

#pragma mark --

@implementation EVECharacterInfo

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) characterInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECharacterInfo alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) aCharacterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	NSURL* url;
	if (keyID && vCode)
		url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterInfo.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, aCharacterID]];
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

@end

