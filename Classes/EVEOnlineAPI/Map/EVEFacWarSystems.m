//
//  EVEFacWarSystems.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarSystems.h"


@implementation EVEFacWarSystemsItem

+ (id) facWarSystemsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEFacWarSystemsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.occupyingFactionID = [[attributeDict valueForKey:@"occupyingFactionID"] integerValue];
		self.occupyingFactionName = [attributeDict valueForKey:@"occupyingFactionName"];
		self.contested = [[attributeDict valueForKey:@"contested"] compare:@"True" options:NSCaseInsensitiveSearch] == NSOrderedSame ? TRUE : FALSE;
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeObject:self.solarSystemName forKey:@"solarSystemName"];
	[aCoder encodeInteger:self.occupyingFactionID forKey:@"occupyingFactionID"];
	[aCoder encodeObject:self.occupyingFactionName forKey:@"occupyingFactionName"];
	[aCoder encodeBool:self.contested forKey:@"contested"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.solarSystemID = [aDecoder decodeIntegerForKey:@"solarSystemID"];
		self.solarSystemName = [aDecoder decodeObjectForKey:@"solarSystemName"];
		self.occupyingFactionID = [aDecoder decodeIntegerForKey:@"occupyingFactionID"];
		self.occupyingFactionName = [aDecoder decodeObjectForKey:@"occupyingFactionName"];
		self.contested = [aDecoder decodeBoolForKey:@"contested"];
	}
	return self;
}

@end


@implementation EVEFacWarSystems

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarSystemsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEFacWarSystems alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/FacWarSystems.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"solarSystems"]) {
		self.solarSystems = [[NSMutableArray alloc] init];
		return self.solarSystems;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"solarSystems"]) {
		EVEFacWarSystemsItem *facWarSystemsItem = [EVEFacWarSystemsItem facWarSystemsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarSystemsItem];
		return facWarSystemsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.solarSystems forKey:@"solarSystems"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.solarSystems = [aDecoder decodeObjectForKey:@"solarSystems"];
	}
	return self;
}

@end