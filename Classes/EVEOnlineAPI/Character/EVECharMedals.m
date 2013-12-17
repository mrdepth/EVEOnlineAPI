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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.medalID forKey:@"medalID"];
	[aCoder encodeObject:self.reason forKey:@"reason"];
	[aCoder encodeObject:self.status forKey:@"status"];
	[aCoder encodeInteger:self.issuerID forKey:@"issuerID"];
	[aCoder encodeObject:self.issued forKey:@"issued"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.medalID = [aDecoder decodeIntegerForKey:@"medalID"];
		self.reason = [aDecoder decodeObjectForKey:@"reason"];
		self.status = [aDecoder decodeObjectForKey:@"status"];
		self.issuerID = [aDecoder decodeIntegerForKey:@"issuerID"];
		self.issued = [aDecoder decodeObjectForKey:@"issued"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.medalID forKey:@"medalID"];
	[aCoder encodeObject:self.reason forKey:@"reason"];
	[aCoder encodeObject:self.status forKey:@"status"];
	[aCoder encodeInteger:self.issuerID forKey:@"issuerID"];
	[aCoder encodeObject:self.issued forKey:@"issued"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.description forKey:@"description"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.medalID = [aDecoder decodeIntegerForKey:@"medalID"];
		self.reason = [aDecoder decodeObjectForKey:@"reason"];
		self.status = [aDecoder decodeObjectForKey:@"status"];
		self.issuerID = [aDecoder decodeIntegerForKey:@"issuerID"];
		self.issued = [aDecoder decodeObjectForKey:@"issued"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
	}
	return self;
}

@end


@implementation EVECharMedals

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.currentCorporation forKey:@"currentCorporation"];
	[aCoder encodeObject:self.otherCorporations forKey:@"otherCorporations"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.currentCorporation = [aDecoder decodeObjectForKey:@"currentCorporation"];
		self.otherCorporations = [aDecoder decodeObjectForKey:@"otherCorporations"];
	}
	return self;
}

@end