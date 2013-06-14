//
//  EVECharMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharMedals.h"

@implementation EVECharCurrentCorporationMedal

+ (id) charCurrentCorporationMedalWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharCurrentCorporationMedal alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] integerValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.status = [attributeDict valueForKey:@"status"];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
	}
	return self;
}

@end


@implementation EVECharOtherCorporationsMedal

+ (id) charOtherCorporationsMedalWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharOtherCorporationsMedal alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] integerValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.status = [attributeDict valueForKey:@"status"];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.title = [attributeDict valueForKey:@"title"];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

@end


@implementation EVECharMedals

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECharMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"currentCorporation"]) {
		self.currentCorporation = [[NSMutableArray alloc] init];
		return self.currentCorporation;
	}
	else if ([rowset isEqualToString:@"otherCorporations"]) {
		self.otherCorporations = [[NSMutableArray alloc] init];
		return self.otherCorporations;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"currentCorporation"]) {
		EVECharCurrentCorporationMedal *charCurrentCorporationMedal = [EVECharCurrentCorporationMedal charCurrentCorporationMedalWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.currentCorporation addObject:charCurrentCorporationMedal];
		return charCurrentCorporationMedal;
	}
	else if ([rowset isEqualToString:@"otherCorporations"]) {
		EVECharOtherCorporationsMedal *charOtherCorporationsMedal = [EVECharOtherCorporationsMedal charOtherCorporationsMedalWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.otherCorporations addObject:charOtherCorporationsMedal];
		return charOtherCorporationsMedal;
	}
	return nil;
}

@end