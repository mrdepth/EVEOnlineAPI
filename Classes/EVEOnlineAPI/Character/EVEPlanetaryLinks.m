//
//  EVEPlanetaryLinks.m
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVEPlanetaryLinks.h"

@implementation EVEPlanetaryLinksItem

+ (id) planetaryLinksItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEPlanetaryLinksItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.sourcePinID = [[attributeDict valueForKey:@"sourcePinID"] longLongValue];
		self.destinationPinID = [[attributeDict valueForKey:@"destinationPinID"] longLongValue];
		self.linkLevel = [[attributeDict valueForKey:@"linkLevel"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.sourcePinID forKey:@"sourcePinID"];
	[aCoder encodeInt64:self.destinationPinID forKey:@"destinationPinID"];
	[aCoder encodeInt32:self.linkLevel forKey:@"linkLevel"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.sourcePinID = [aDecoder decodeInt64ForKey:@"sourcePinID"];
		self.destinationPinID = [aDecoder decodeInt64ForKey:@"destinationPinID"];
		self.linkLevel = [aDecoder decodeInt32ForKey:@"linkLevel"];
	}
	return self;
}

@end


@implementation EVEPlanetaryLinks

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) planetaryLinksWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEPlanetaryLinks alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID planetID:planetID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/PlanetaryLinks.xml.aspx?keyID=%d&vCode=%@&characterID=%d&planetID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, planetID]]
					  cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"links"]) {
		self.links = [[NSMutableArray alloc] init];
		return self.links;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"links"]) {
		EVEPlanetaryLinksItem *linksItem = [EVEPlanetaryLinksItem planetaryLinksItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.links addObject:linksItem];
		return linksItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.links forKey:@"links"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.links = [aDecoder decodeObjectForKey:@"links"];
	}
	return self;
}

@end