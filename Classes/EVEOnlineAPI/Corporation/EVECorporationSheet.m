//
//  EVECorporationSheet.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorporationSheet.h"


@implementation EVECorporationSheetDivisionItem
@synthesize description = _description;

+ (id) corporationSheetDivisionItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECorporationSheetDivisionItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.accountKey = [[attributeDict valueForKey:@"accountKey"] intValue];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.accountKey forKey:@"accountKey"];
	[aCoder encodeObject:self.description forKey:@"description"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.accountKey = [aDecoder decodeInt32ForKey:@"accountKey"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
	}
	return self;
}

@end

@implementation EVECorporationSheetLogo

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.graphicID forKey:@"graphicID"];
	[aCoder encodeInt32:self.shape1 forKey:@"shape1"];
	[aCoder encodeInt32:self.shape2 forKey:@"shape2"];
	[aCoder encodeInt32:self.shape3 forKey:@"shape3"];
	[aCoder encodeInt32:self.color1 forKey:@"color1"];
	[aCoder encodeInt32:self.color2 forKey:@"color2"];
	[aCoder encodeInt32:self.color3 forKey:@"color3"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.graphicID = [aDecoder decodeInt32ForKey:@"graphicID"];
		self.shape1 = [aDecoder decodeInt32ForKey:@"shape1"];
		self.shape2 = [aDecoder decodeInt32ForKey:@"shape2"];
		self.shape3 = [aDecoder decodeInt32ForKey:@"shape3"];
		self.color1 = [aDecoder decodeInt32ForKey:@"color1"];
		self.color2 = [aDecoder decodeInt32ForKey:@"color2"];
		self.color3 = [aDecoder decodeInt32ForKey:@"color3"];
	}
	return self;
}

@end


@implementation EVECorporationSheet
@synthesize description = _description;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) corporationSheetWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporationID: (int32_t) corporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECorporationSheet alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporationID:corporationID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporationID: (int32_t) aCorporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/CorporationSheet.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID,
														(aCorporationID > 0 ? [NSString stringWithFormat:@"&corporationID=%d", aCorporationID] : @"")]]
					   cachePolicy:cachePolicy
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
		self.corporationID = [self.text intValue];
	else if ([elementName isEqualToString:@"corporationName"])
		self.corporationName = self.text;
	else if ([elementName isEqualToString:@"ticker"])
		self.ticker = self.text;
	else if ([elementName isEqualToString:@"ceoID"])
		self.ceoID = [self.text intValue];
	else if ([elementName isEqualToString:@"ceoName"])
		self.ceoName = self.text;
	else if ([elementName isEqualToString:@"stationID"])
		self.stationID = [self.text intValue];
	else if ([elementName isEqualToString:@"stationName"])
		self.stationName = self.text;
	else if ([elementName isEqualToString:@"description"])
		self.description = self.text;
	else if ([elementName isEqualToString:@"url"])
		self.url = self.text;
	else if ([elementName isEqualToString:@"allianceID"])
		self.allianceID = [self.text intValue];
	else if ([elementName isEqualToString:@"allianceName"])
		self.allianceName = self.text;
	else if ([elementName isEqualToString:@"taxRate"])
		self.taxRate = [self.text floatValue];
	else if ([elementName isEqualToString:@"memberCount"])
		self.memberCount = [self.text intValue];
	else if ([elementName isEqualToString:@"memberLimit"])
		self.memberLimit = [self.text intValue];
	else if ([elementName isEqualToString:@"shares"])
		self.shares = [self.text intValue];
	else if ([elementName isEqualToString:@"graphicID"])
		self.logo.graphicID = [self.text intValue];
	else if ([elementName isEqualToString:@"shape1"])
		self.logo.shape1 = [self.text intValue];
	else if ([elementName isEqualToString:@"shape2"])
		self.logo.shape2 = [self.text intValue];
	else if ([elementName isEqualToString:@"shape3"])
		self.logo.shape3 = [self.text intValue];
	else if ([elementName isEqualToString:@"color1"])
		self.logo.color1 = [self.text intValue];
	else if ([elementName isEqualToString:@"color2"])
		self.logo.color2 = [self.text intValue];
	else if ([elementName isEqualToString:@"color3"])
		self.logo.color3 = [self.text intValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInt32:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	[aCoder encodeObject:self.ticker forKey:@"ticker"];
	[aCoder encodeInt32:self.ceoID forKey:@"ceoID"];
	[aCoder encodeObject:self.ceoName forKey:@"ceoName"];
	
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	[aCoder encodeObject:self.stationName forKey:@"stationName"];
	[aCoder encodeObject:self.description forKey:@"description"];
	[aCoder encodeObject:self.url forKey:@"url"];

	[aCoder encodeInt32:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.allianceName forKey:@"allianceName"];
	[aCoder encodeFloat:self.taxRate forKey:@"taxRate"];

	[aCoder encodeInt32:self.memberCount forKey:@"memberCount"];
	[aCoder encodeInt32:self.memberLimit forKey:@"memberLimit"];
	[aCoder encodeInt32:self.shares forKey:@"shares"];
	
	[aCoder encodeObject:self.divisions forKey:@"divisions"];
	[aCoder encodeObject:self.walletDivisions forKey:@"walletDivisions"];
	[aCoder encodeObject:self.logo forKey:@"logo"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.corporationID = [aDecoder decodeInt32ForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		self.ticker = [aDecoder decodeObjectForKey:@"ticker"];
		self.ceoID = [aDecoder decodeInt32ForKey:@"ceoID"];
		self.ceoName = [aDecoder decodeObjectForKey:@"ceoName"];
		
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
		self.url = [aDecoder decodeObjectForKey:@"url"];

		self.allianceID = [aDecoder decodeInt32ForKey:@"allianceID"];
		self.allianceName = [aDecoder decodeObjectForKey:@"allianceName"];
		self.taxRate = [aDecoder decodeFloatForKey:@"taxRate"];

		self.memberCount = [aDecoder decodeInt32ForKey:@"memberCount"];
		self.memberLimit = [aDecoder decodeInt32ForKey:@"memberLimit"];
		self.shares = [aDecoder decodeInt32ForKey:@"shares"];
		
		self.divisions = [aDecoder decodeObjectForKey:@"divisions"];
		self.walletDivisions= [aDecoder decodeObjectForKey:@"walletDivisions"];
		self.logo = [aDecoder decodeObjectForKey:@"logo"];
	}
	return self;
}

@end
