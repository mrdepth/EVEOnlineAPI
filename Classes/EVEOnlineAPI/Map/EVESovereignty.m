//
//  EVESovereignty.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESovereignty.h"


@implementation EVESovereigntyItem

+ (id) sovereigntyItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVESovereigntyItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] integerValue];
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeInteger:self.allianceID forKey:@"allianceID"];
	[aCoder encodeInteger:self.factionID forKey:@"factionID"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.solarSystemName forKey:@"solarSystemName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.solarSystemID = [aDecoder decodeIntegerForKey:@"solarSystemID"];
		self.allianceID = [aDecoder decodeIntegerForKey:@"allianceID"];
		self.factionID = [aDecoder decodeIntegerForKey:@"factionID"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.solarSystemName = [aDecoder decodeObjectForKey:@"solarSystemName"];
	}
	return self;
}

@end


@implementation EVESovereignty

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) sovereigntyWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVESovereignty alloc] initWithCachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Sovereignty.xml.aspx", EVEOnlineAPIHost]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = [super parseData:data];
	self.cachedUntil = [self.currentTime dateByAddingTimeInterval:3600 * 24];
	self.cacheExpireDate = [self localTimeWithServerTime:self.cachedUntil];
	return error;
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
		EVESovereigntyItem *sovereigntyItem = [EVESovereigntyItem sovereigntyItemWithXMLAttributes:attributeDict];
		[object addObject:sovereigntyItem];
		return sovereigntyItem;
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