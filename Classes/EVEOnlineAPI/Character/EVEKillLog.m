//
//  EVEKillLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEKillLog.h"

@implementation EVEKillLogVictim

+ (id) killLogVictimWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEKillLogVictim alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] integerValue];
		self.allianceName = [attributeDict valueForKey:@"allianceName"];
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.damageTaken = [[attributeDict valueForKey:@"damageTaken"] integerValue];
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.shipTypeID = [[attributeDict valueForKey:@"shipTypeID"] integerValue];
	}
	return self;
}

@end


@implementation EVEKillLogAttacker

+ (id) killLogAttackerWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEKillLogAttacker alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] integerValue];
		self.allianceName = [attributeDict valueForKey:@"allianceName"];
		self.securityStatus = [[attributeDict valueForKey:@"securityStatus"] floatValue];
		self.damageDone = [[attributeDict valueForKey:@"damageDone"] integerValue];
		self.finalBlow = [[attributeDict valueForKey:@"finalBlow"] boolValue];
		self.weaponTypeID = [[attributeDict valueForKey:@"weaponTypeID"] integerValue];
		self.shipTypeID = [[attributeDict valueForKey:@"shipTypeID"] integerValue];
	}
	return self;
}

@end

@implementation EVEKillLogItem

+ (id) killLogItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEKillLogItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.flag = [[attributeDict valueForKey:@"flag"] integerValue];
		self.qtyDropped = [[attributeDict valueForKey:@"qtyDropped"] integerValue];
		self.qtyDestroyed = [[attributeDict valueForKey:@"qtyDestroyed"] integerValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
	}
	return self;
}

@end

@implementation EVEKillLogKill

+ (id) killLogKillWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEKillLogKill alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.killID = [[attributeDict valueForKey:@"killID"] integerValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.killTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"killTime"]];
		self.moonID = [[attributeDict valueForKey:@"moonID"] integerValue];
	}
	return self;
}

@end


@implementation EVEKillLog

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEKillLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeKillID:beforeKillID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/KillLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID,
														(beforeKillID > 0 ? [NSString stringWithFormat:@"&beforeKillID=%d", beforeKillID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"kills"]) {
		self.kills = [[NSMutableArray alloc] init];
		return self.kills;
	}
	else if ([rowset isEqualToString:@"attackers"]) {
		NSMutableArray *attackers = [NSMutableArray array];
		[[self currentRow] setAttackers:attackers];
		return attackers;
	}
	else if ([rowset isEqualToString:@"items"]) {
		NSMutableArray *items = [NSMutableArray array];
		[[self currentRow] setItems:items];
		return items;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"kills"]) {
		EVEKillLogKill *kill = [EVEKillLogKill killLogKillWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.kills addObject:kill];
		return kill;
	}
	else if ([rowset isEqualToString:@"attackers"]) {
		EVEKillLogAttacker *attacker = [EVEKillLogAttacker killLogAttackerWithXMLAttributes:attributeDict];
		[object addObject:attacker];
		return attacker;
	}
	else if ([rowset isEqualToString:@"items"]) {
		EVEKillLogItem *item = [EVEKillLogItem killLogItemWithXMLAttributes:attributeDict];
		[object addObject:item];
		return item;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"victim"])
		[[self currentRow] setVictim:[EVEKillLogVictim killLogVictimWithXMLAttributes:attributeDict]];
}

@end
