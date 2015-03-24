//
//  EVEPlanetaryPins.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryPins.h"

@implementation EVEPlanetaryPinsItem

+ (id) planetaryPinsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEPlanetaryPinsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.pinID = [[attributeDict valueForKey:@"pinID"] longLongValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];

		self.typeName = [attributeDict valueForKey:@"typeName"];
		self.schematicID = [[attributeDict valueForKey:@"schematicID"] intValue];
		
		self.lastLaunchTime = [attributeDict valueForKey:@"lastLaunchTime"];
		self.cycleTime = [[attributeDict valueForKey:@"cycleTime"] intValue];
		self.quantityPerCycle = [[attributeDict valueForKey:@"quantityPerCycle"] intValue];

		self.installTime = [attributeDict valueForKey:@"installTime"];
		self.expiryTime = [attributeDict valueForKey:@"expiryTime"];

		self.contentTypeID = [[attributeDict valueForKey:@"contentTypeID"] intValue];
		self.contentTypeName = [attributeDict valueForKey:@"contentTypeName"];
		self.contentQuantity = [[attributeDict valueForKey:@"contentQuantity"] intValue];
		
		self.longitude = [[attributeDict valueForKey:@"longitude"] doubleValue];
		self.latitude = [[attributeDict valueForKey:@"latitude"] doubleValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.pinID forKey:@"pinID"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];

	[aCoder encodeObject:self.typeName forKey:@"typeName"];
	[aCoder encodeInt32:self.schematicID forKey:@"schematicID"];
	
	[aCoder encodeObject:self.lastLaunchTime forKey:@"lastLaunchTime"];
	[aCoder encodeInt32:self.cycleTime forKey:@"cycleTime"];
	[aCoder encodeInt32:self.quantityPerCycle forKey:@"quantityPerCycle"];
	
	[aCoder encodeObject:self.installTime forKey:@"installTime"];
	[aCoder encodeObject:self.expiryTime forKey:@"expiryTime"];
	
	[aCoder encodeInt32:self.contentTypeID forKey:@"contentTypeID"];
	[aCoder encodeObject:self.contentTypeName forKey:@"contentTypeName"];
	[aCoder encodeInt32:self.contentQuantity forKey:@"contentQuantity"];
	[aCoder encodeDouble:self.longitude forKey:@"longitude"];
	[aCoder encodeDouble:self.latitude forKey:@"latitude"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.pinID = [aDecoder decodeInt64ForKey:@"pinID"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];

		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
		self.schematicID = [aDecoder decodeInt32ForKey:@"schematicID"];
		
		self.lastLaunchTime = [aDecoder decodeObjectForKey:@"lastLaunchTime"];
		self.cycleTime = [aDecoder decodeInt32ForKey:@"cycleTime"];
		self.quantityPerCycle = [aDecoder decodeInt32ForKey:@"quantityPerCycle"];
		
		self.installTime = [aDecoder decodeObjectForKey:@"installTime"];
		self.expiryTime = [aDecoder decodeObjectForKey:@"expiryTime"];
		
		self.contentTypeID = [aDecoder decodeInt32ForKey:@"contentTypeID"];
		self.contentTypeName = [aDecoder decodeObjectForKey:@"contentTypeName"];
		self.contentQuantity = [aDecoder decodeInt32ForKey:@"contentQuantity"];
		self.longitude = [aDecoder decodeDoubleForKey:@"longitude"];
		self.latitude = [aDecoder decodeDoubleForKey:@"latitude"];
	}
	return self;
}

@end


@implementation EVEPlanetaryPins

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) planetaryPinsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEPlanetaryPins alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID planetID:planetID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/PlanetaryPins.xml.aspx?keyID=%d&vCode=%@&characterID=%d&planetID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, planetID]]
					  cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"pins"]) {
		self.pins = [[NSMutableArray alloc] init];
		return self.pins;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"pins"]) {
		EVEPlanetaryPinsItem *pinsItem = [EVEPlanetaryPinsItem planetaryPinsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.pins addObject:pinsItem];
		return pinsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.pins forKey:@"pins"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.pins = [aDecoder decodeObjectForKey:@"pins"];
	}
	return self;
}

@end