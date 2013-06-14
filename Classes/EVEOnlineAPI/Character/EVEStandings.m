//
//  EVEStandings.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStandings.h"

@implementation EVEStandingsItem

+ (id) standingsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEStandingsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.fromID = [[attributeDict valueForKey:@"fromID"] integerValue];
		self.fromName = [attributeDict valueForKey:@"fromName"];
		self.standing = [[attributeDict valueForKey:@"standing"] floatValue];
	}
	return self;
}

@end


@implementation EVEStandingsNPCStandings
@end

@implementation EVEStandings

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEStandings alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Standings.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") , keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if (!self.standings)
		self.standings = [[EVEStandingsNPCStandings alloc] init];
	if ([rowset isEqualToString:@"agents"]) {
		self.standings.agents = [[NSMutableArray alloc] init];
		return self.standings.agents;
	}
	else if ([rowset isEqualToString:@"NPCCorporations"]) {
		self.standings.NPCCorporations = [[NSMutableArray alloc] init];
		return self.standings.NPCCorporations;
	}
	else if ([rowset isEqualToString:@"factions"]) {
		self.standings.factions = [[NSMutableArray alloc] init];
		return self.standings.factions;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	EVEStandingsItem *standingsItem = [EVEStandingsItem standingsItemWithXMLAttributes:attributeDict];
	[object addObject:standingsItem];
	return standingsItem;
}

@end