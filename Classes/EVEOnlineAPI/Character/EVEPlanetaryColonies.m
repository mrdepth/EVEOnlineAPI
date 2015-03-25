//
//  EVEPlanetaryColonies.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryColonies.h"

@implementation EVEPlanetaryColoniesItem

+ (id) planetaryColoniesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEPlanetaryColoniesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] intValue];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.planetID = [[attributeDict valueForKey:@"planetID"] intValue];
		self.planetName = [attributeDict valueForKey:@"planetName"];
		self.planetTypeID = [[attributeDict valueForKey:@"planetTypeID"] intValue];
		self.planetTypeName = [attributeDict valueForKey:@"planetTypeName"];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] intValue];
		self.ownerName = [attributeDict valueForKey:@"ownerName"];
		self.lastUpdate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"lastUpdate"]];
		self.upgradeLevel = [[attributeDict valueForKey:@"upgradeLevel"] intValue];
		self.numberOfPins = [[attributeDict valueForKey:@"numberOfPins"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeObject:self.solarSystemName forKey:@"solarSystemName"];
	[aCoder encodeInt32:self.planetID forKey:@"planetID"];
	[aCoder encodeObject:self.planetName forKey:@"planetName"];
	[aCoder encodeInt32:self.planetTypeID forKey:@"planetTypeID"];
	[aCoder encodeObject:self.planetTypeName forKey:@"planetTypeName"];
	[aCoder encodeInt32:self.ownerID forKey:@"ownerID"];
	[aCoder encodeObject:self.ownerName forKey:@"ownerName"];
	[aCoder encodeObject:self.lastUpdate forKey:@"lastUpdate"];
	[aCoder encodeInt32:self.upgradeLevel forKey:@"upgradeLevel"];
	[aCoder encodeInt32:self.numberOfPins forKey:@"numberOfPins"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.solarSystemID = [aDecoder decodeInt32ForKey:@"solarSystemID"];
		self.solarSystemName = [aDecoder decodeObjectForKey:@"solarSystemName"];
		self.planetID = [aDecoder decodeInt32ForKey:@"planetID"];
		self.planetName = [aDecoder decodeObjectForKey:@"planetName"];
		self.planetTypeID = [aDecoder decodeInt32ForKey:@"planetTypeID"];
		self.planetTypeName = [aDecoder decodeObjectForKey:@"planetTypeName"];
		self.ownerID = [aDecoder decodeInt32ForKey:@"ownerID"];
		self.ownerName = [aDecoder decodeObjectForKey:@"ownerName"];
		self.lastUpdate = [aDecoder decodeObjectForKey:@"lastUpdate"];
		self.upgradeLevel = [aDecoder decodeInt32ForKey:@"upgradeLevel"];
		self.numberOfPins = [aDecoder decodeInt32ForKey:@"numberOfPins"];
	}
	return self;
}

@end


@implementation EVEPlanetaryColonies

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) planetaryColoniesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEPlanetaryColonies alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/PlanetaryColonies.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					  cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"colonies"]) {
		self.colonies = [[NSMutableArray alloc] init];
		return self.colonies;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"colonies"]) {
		EVEPlanetaryColoniesItem *coloniesItem = [EVEPlanetaryColoniesItem planetaryColoniesItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.colonies addObject:coloniesItem];
		return coloniesItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.colonies forKey:@"colonies"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.colonies = [aDecoder decodeObjectForKey:@"colonies"];
	}
	return self;
}

@end