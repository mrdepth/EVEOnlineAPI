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
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] intValue];
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] intValue];
		self.factionID = [[attributeDict valueForKey:@"factionID"] intValue];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeInt32:self.allianceID forKey:@"allianceID"];
	[aCoder encodeInt32:self.factionID forKey:@"factionID"];
	[aCoder encodeInt32:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.solarSystemName forKey:@"solarSystemName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.solarSystemID = [aDecoder decodeInt32ForKey:@"solarSystemID"];
		self.allianceID = [aDecoder decodeInt32ForKey:@"allianceID"];
		self.factionID = [aDecoder decodeInt32ForKey:@"factionID"];
		self.corporationID = [aDecoder decodeInt32ForKey:@"corporationID"];
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