//
//  EVEPlanetaryRoutes.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryRoutes.h"

@implementation EVEPlanetaryRoutesItem

+ (id) planetaryRoutesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEPlanetaryRoutesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.routeID = [[attributeDict valueForKey:@"routeID"] longLongValue];
		self.sourcePinID = [[attributeDict valueForKey:@"sourcePinID"] longLongValue];
		self.destinationPinID = [[attributeDict valueForKey:@"destinationPinID"] longLongValue];
		self.contentTypeID = [[attributeDict valueForKey:@"contentTypeID"] intValue];
		self.contentTypeName = [attributeDict valueForKey:@"contentTypeName"];
		self.quantity = [[attributeDict valueForKey:@"quantity"] intValue];
		
		self.waypoint1 = [[attributeDict valueForKey:@"waypoint1"] longLongValue];
		self.waypoint2 = [[attributeDict valueForKey:@"waypoint2"] longLongValue];
		self.waypoint3 = [[attributeDict valueForKey:@"waypoint3"] longLongValue];
		self.waypoint4 = [[attributeDict valueForKey:@"waypoint4"] longLongValue];
		self.waypoint5 = [[attributeDict valueForKey:@"waypoint5"] longLongValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.routeID forKey:@"routeID"];
	[aCoder encodeInt64:self.sourcePinID forKey:@"sourcePinID"];
	[aCoder encodeInt64:self.destinationPinID forKey:@"destinationPinID"];
	[aCoder encodeInt32:self.contentTypeID forKey:@"contentTypeID"];
	[aCoder encodeObject:self.contentTypeName forKey:@"contentTypeName"];
	[aCoder encodeInt32:self.quantity forKey:@"quantity"];
	
	[aCoder encodeInt64:self.waypoint1 forKey:@"waypoint1"];
	[aCoder encodeInt64:self.waypoint2 forKey:@"waypoint2"];
	[aCoder encodeInt64:self.waypoint3 forKey:@"waypoint3"];
	[aCoder encodeInt64:self.waypoint4 forKey:@"waypoint4"];
	[aCoder encodeInt64:self.waypoint5 forKey:@"waypoint5"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.routeID = [aDecoder decodeInt64ForKey:@"routeID"];
		self.sourcePinID = [aDecoder decodeInt64ForKey:@"sourcePinID"];
		self.destinationPinID = [aDecoder decodeInt64ForKey:@"destinationPinID"];
		self.contentTypeID = [aDecoder decodeInt32ForKey:@"contentTypeID"];
		self.contentTypeName = [aDecoder decodeObjectForKey:@"contentTypeName"];
		self.quantity = [aDecoder decodeInt32ForKey:@"quantity"];
		
		self.waypoint1 = [aDecoder decodeInt64ForKey:@"waypoint1"];
		self.waypoint2 = [aDecoder decodeInt64ForKey:@"waypoint2"];
		self.waypoint3 = [aDecoder decodeInt64ForKey:@"waypoint3"];
		self.waypoint4 = [aDecoder decodeInt64ForKey:@"waypoint4"];
		self.waypoint5 = [aDecoder decodeInt64ForKey:@"waypoint5"];
	}
	return self;
}

@end


@implementation EVEPlanetaryRoutes

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) planetaryRoutesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEPlanetaryRoutes alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID planetID:planetID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/PlanetaryRoutes.xml.aspx?keyID=%d&vCode=%@&characterID=%d&planetID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, planetID]]
					  cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"routes"]) {
		self.routes = [[NSMutableArray alloc] init];
		return self.routes;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"routes"]) {
		EVEPlanetaryRoutesItem *routesItem = [EVEPlanetaryRoutesItem planetaryRoutesItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.routes addObject:routesItem];
		return routesItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.routes forKey:@"routes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.routes = [aDecoder decodeObjectForKey:@"routes"];
	}
	return self;
}

@end