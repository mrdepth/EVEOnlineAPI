//
//  EVEAllianceList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAllianceList.h"


@implementation EVEAllianceListItem

+ (id) allianceListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEAllianceListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.name = [attributeDict valueForKey:@"name"];
		self.shortName = [attributeDict valueForKey:@"shortName"];
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] integerValue];
		self.executorCorpID = [[attributeDict valueForKey:@"executorCorpID"] integerValue];
		self.memberCount = [[attributeDict valueForKey:@"memberCount"] integerValue];
		self.startDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startDate"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:self.shortName forKey:@"shortName"];
	[aCoder encodeInteger:self.allianceID forKey:@"allianceID"];
	[aCoder encodeInteger:self.executorCorpID forKey:@"executorCorpID"];
	[aCoder encodeInteger:self.memberCount forKey:@"memberCount"];
	[aCoder encodeObject:self.startDate forKey:@"startDate"];
	[aCoder encodeObject:self.memberCorporations forKey:@"memberCorporations"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.shortName = [aDecoder decodeObjectForKey:@"shortName"];
		self.allianceID = [aDecoder decodeIntegerForKey:@"allianceID"];
		self.executorCorpID = [aDecoder decodeIntegerForKey:@"executorCorpID"];
		self.memberCount = [aDecoder decodeIntegerForKey:@"memberCount"];
		self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
		self.memberCorporations = [aDecoder decodeObjectForKey:@"memberCorporations"];
	}
	return self;
}

@end


@implementation EVEAllianceListMemberCorporationsItem


+ (id) allianceListMemberCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEAllianceListMemberCorporationsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.corporationID = [[attributeDict valueForKey:@"allianceID"] corporationID];
		self.startDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startDate"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.startDate forKey:@"startDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
	}
	return self;
}

@end


@implementation EVEAllianceList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) allianceListWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEAllianceList alloc] initWithCachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/AllianceList.xml.aspx", EVEOnlineAPIHost]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = [super parseData:data];
	self.cachedUntil = [self.currentTime dateByAddingTimeInterval:3600];
	self.cacheExpireDate = [self localTimeWithServerTime:self.cachedUntil];
	return error;
}

- (NSDictionary*) alliancesMap {
	if (!_alliancesMap) {
		_alliancesMap = [[NSMutableDictionary alloc] initWithCapacity:self.alliances.count];
		for (EVEAllianceListItem* item in self.alliances)
			((NSMutableDictionary*) _alliancesMap)[@(item.allianceID)] = item;
	}
	return _alliancesMap;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"alliances"]) {
		self.alliances = [[NSMutableArray alloc] init];
		return self.alliances;
	}
	else if ([rowset isEqualToString:@"memberCorporations"]) {
		NSMutableArray *memberCorporations = [[NSMutableArray alloc] init];
		[self.currentRow setMemberCorporations:memberCorporations];
		return memberCorporations;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"alliances"]) {
		EVEAllianceListItem *allianceListItem = [EVEAllianceListItem allianceListItemWithXMLAttributes:attributeDict];
		[object addObject:allianceListItem];
		return allianceListItem;
	}
	else if ([rowset isEqualToString:@"memberCorporations"]) {
		EVEAllianceListMemberCorporationsItem *allianceListMemberCorporationsItem = [EVEAllianceListMemberCorporationsItem allianceListMemberCorporationsItemWithXMLAttributes:attributeDict];
		[object addObject:allianceListMemberCorporationsItem];
		return allianceListMemberCorporationsItem;
	}
	
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.alliances forKey:@"alliances"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.alliances = [aDecoder decodeObjectForKey:@"alliances"];
	}
	return self;
}

@end