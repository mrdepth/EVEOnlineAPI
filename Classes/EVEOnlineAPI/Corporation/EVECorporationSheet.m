//
//  EVECorporationSheet.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorporationSheet.h"


@implementation EVECorporationSheetDivisionItem

+ (id) corporationSheetDivisionItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECorporationSheetDivisionItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.accountKey = [[attributeDict valueForKey:@"accountKey"] integerValue];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

@end

@implementation EVECorporationSheetLogo
@end


@implementation EVECorporationSheet

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) corporationSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECorporationSheet alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporationID:corporationID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) aCorporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/CorporationSheet.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID,
														(aCorporationID > 0 ? [NSString stringWithFormat:@"&corporationID=%d", aCorporationID] : @"")]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"divisions"]) {
		self.divisions = [[NSMutableArray alloc] init];
		return self.divisions;
	}
	else if ([rowset isEqualToString:@"walletDivisions"]) {
		self.walletDivisions = [[NSMutableArray alloc] init];
		return self.walletDivisions;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"divisions"] || [rowset isEqualToString:@"walletDivisions"]) {
		EVECorporationSheetDivisionItem *corporationSheetDivisionItem = [EVECorporationSheetDivisionItem corporationSheetDivisionItemWithXMLAttributes:attributeDict];
		[object addObject:corporationSheetDivisionItem];
		return corporationSheetDivisionItem;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"logo"])
		self.logo = [[EVECorporationSheetLogo alloc] init];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"corporationID"])
		self.corporationID = [self.text integerValue];
	else if ([elementName isEqualToString:@"corporationName"])
		self.corporationName = self.text;
	else if ([elementName isEqualToString:@"ticker"])
		self.ticker = self.text;
	else if ([elementName isEqualToString:@"ceoID"])
		self.ceoID = [self.text integerValue];
	else if ([elementName isEqualToString:@"ceoName"])
		self.ceoName = self.text;
	else if ([elementName isEqualToString:@"stationID"])
		self.stationID = [self.text integerValue];
	else if ([elementName isEqualToString:@"stationName"])
		self.stationName = self.text;
	else if ([elementName isEqualToString:@"description"])
		self.description = self.text;
	else if ([elementName isEqualToString:@"url"])
		self.url = self.text;
	else if ([elementName isEqualToString:@"allianceID"])
		self.allianceID = [self.text integerValue];
	else if ([elementName isEqualToString:@"allianceName"])
		self.allianceName = self.text;
	else if ([elementName isEqualToString:@"taxRate"])
		self.taxRate = [self.text floatValue];
	else if ([elementName isEqualToString:@"memberCount"])
		self.memberCount = [self.text integerValue];
	else if ([elementName isEqualToString:@"memberLimit"])
		self.memberLimit = [self.text integerValue];
	else if ([elementName isEqualToString:@"shares"])
		self.shares = [self.text integerValue];
	else if ([elementName isEqualToString:@"graphicID"])
		self.logo.graphicID = [self.text integerValue];
	else if ([elementName isEqualToString:@"shape1"])
		self.logo.shape1 = [self.text integerValue];
	else if ([elementName isEqualToString:@"shape2"])
		self.logo.shape2 = [self.text integerValue];
	else if ([elementName isEqualToString:@"shape3"])
		self.logo.shape3 = [self.text integerValue];
	else if ([elementName isEqualToString:@"color1"])
		self.logo.color1 = [self.text integerValue];
	else if ([elementName isEqualToString:@"color2"])
		self.logo.color2 = [self.text integerValue];
	else if ([elementName isEqualToString:@"color3"])
		self.logo.color3 = [self.text integerValue];
}

@end
