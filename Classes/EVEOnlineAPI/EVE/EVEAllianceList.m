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

@end


@implementation EVEAllianceList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) allianceListWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEAllianceList alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/AllianceList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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
	if (!self.alliancesMap) {
		self.alliancesMap = [[NSMutableDictionary alloc] initWithCapacity:self.alliances.count];
		for (EVEAllianceListItem* item in self.alliances)
			[self.alliancesMap setValue:item forKey:[NSString stringWithFormat:@"%d", item.allianceID]];
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
@end