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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.fromID forKey:@"fromID"];
	[aCoder encodeObject:self.fromName forKey:@"fromName"];
	[aCoder encodeFloat:self.standing forKey:@"standing"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.fromID = [aDecoder decodeIntegerForKey:@"fromID"];
		self.fromName = [aDecoder decodeObjectForKey:@"fromName"];
		self.standing = [aDecoder decodeFloatForKey:@"standing"];
	}
	return self;
}

@end


@implementation EVEStandingsNPCStandings

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.agents forKey:@"agents"];
	[aCoder encodeObject:self.NPCCorporations forKey:@"NPCCorporations"];
	[aCoder encodeObject:self.factions forKey:@"factions"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.agents = [aDecoder decodeObjectForKey:@"agents"];
		self.NPCCorporations = [aDecoder decodeObjectForKey:@"NPCCorporations"];
		self.factions = [aDecoder decodeObjectForKey:@"factions"];
	}
	return self;
}

@end

@implementation EVEStandings

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEStandings alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Standings.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") , keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.standings forKey:@"standings"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.standings = [aDecoder decodeObjectForKey:@"standings"];
	}
	return self;
}

@end