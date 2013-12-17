//
//  EVELocations.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVELocations.h"

@implementation EVELocationsItem

+ (id) locationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVELocationsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		self.itemName = [attributeDict valueForKey:@"itemName"];
		self.x = [[attributeDict valueForKey:@"x"] floatValue];
		self.y = [[attributeDict valueForKey:@"y"] floatValue];
		self.z = [[attributeDict valueForKey:@"z"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.itemID forKey:@"itemID"];
	[aCoder encodeObject:self.itemName forKey:@"itemName"];
	[aCoder encodeFloat:self.x forKey:@"x"];
	[aCoder encodeFloat:self.y forKey:@"y"];
	[aCoder encodeFloat:self.z forKey:@"z"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.itemID = [aDecoder decodeInt64ForKey:@"itemID"];
		self.itemName = [aDecoder decodeObjectForKey:@"itemName"];
		self.x = [aDecoder decodeFloatForKey:@"x"];
		self.y = [aDecoder decodeFloatForKey:@"y"];
		self.z = [aDecoder decodeFloatForKey:@"z"];
	}
	return self;
}

@end


@implementation EVELocations

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) locationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVELocations alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSString* body = [NSString stringWithFormat:@"keyID=%d&vCode=%@&characterID=%d&ids=%@",
					  keyID,
					  vCode,
					  characterID,
					  [ids componentsJoinedByString:@","]];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Locations.xml.aspx",
														EVEOnlineAPIHost,
														(corporate ? @"corp" : @"char")]]
						 bodyData:[body dataUsingEncoding:NSUTF8StringEncoding]
					  contentType:nil
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
		
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"locations"]) {
		self.locations = [[NSMutableArray alloc] init];
		return self.locations;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"locations"]) {
		EVELocationsItem *location = [EVELocationsItem locationsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.locations addObject:location];
		return location;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.locations forKey:@"locations"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.locations = [aDecoder decodeObjectForKey:@"locations"];
	}
	return self;
}

@end