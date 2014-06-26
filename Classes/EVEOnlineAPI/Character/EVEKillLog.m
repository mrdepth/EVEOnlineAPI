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
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] intValue];
		self.allianceName = [attributeDict valueForKey:@"allianceName"];
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] intValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.damageTaken = [[attributeDict valueForKey:@"damageTaken"] intValue];
		self.factionID = [[attributeDict valueForKey:@"factionID"] intValue];
		self.factionName = [attributeDict valueForKey:@"factionName"];
		self.shipTypeID = [[attributeDict valueForKey:@"shipTypeID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.allianceName forKey:@"allianceName"];
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInt32:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	[aCoder encodeInt32:self.damageTaken forKey:@"damageTaken"];
	[aCoder encodeInt32:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInt32:self.shipTypeID forKey:@"shipTypeID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.allianceID = [aDecoder decodeInt32ForKey:@"allianceID"];
		self.allianceName = [aDecoder decodeObjectForKey:@"allianceName"];
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.corporationID = [aDecoder decodeInt32ForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		self.damageTaken = [aDecoder decodeInt32ForKey:@"damageTaken"];
		self.factionID = [aDecoder decodeInt32ForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.shipTypeID = [aDecoder decodeInt32ForKey:@"shipTypeID"];
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
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] intValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] intValue];
		self.allianceName = [attributeDict valueForKey:@"allianceName"];
		self.securityStatus = [[attributeDict valueForKey:@"securityStatus"] floatValue];
		self.damageDone = [[attributeDict valueForKey:@"damageDone"] intValue];
		self.finalBlow = [[attributeDict valueForKey:@"finalBlow"] boolValue];
		self.weaponTypeID = [[attributeDict valueForKey:@"weaponTypeID"] intValue];
		self.shipTypeID = [[attributeDict valueForKey:@"shipTypeID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.allianceName forKey:@"allianceName"];
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInt32:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	
	[aCoder encodeFloat:self.securityStatus forKey:@"securityStatus"];
	[aCoder encodeInt32:self.damageDone forKey:@"damageDone"];
	[aCoder encodeBool:self.finalBlow forKey:@"finalBlow"];
	[aCoder encodeInt32:self.weaponTypeID forKey:@"weaponTypeID"];
	[aCoder encodeInt32:self.shipTypeID forKey:@"shipTypeID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.allianceID = [aDecoder decodeInt32ForKey:@"allianceID"];
		self.allianceName = [aDecoder decodeObjectForKey:@"allianceName"];
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.corporationID = [aDecoder decodeInt32ForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		
		self.securityStatus = [aDecoder decodeFloatForKey:@"securityStatus"];
		self.damageDone = [aDecoder decodeInt32ForKey:@"damageDone"];
		self.finalBlow = [aDecoder decodeBoolForKey:@"finalBlow"];
		self.weaponTypeID = [aDecoder decodeInt32ForKey:@"weaponTypeID"];
		self.shipTypeID = [aDecoder decodeInt32ForKey:@"shipTypeID"];
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
		self.flag = [[attributeDict valueForKey:@"flag"] intValue];
		self.qtyDropped = [[attributeDict valueForKey:@"qtyDropped"] intValue];
		self.qtyDestroyed = [[attributeDict valueForKey:@"qtyDestroyed"] intValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.flag forKey:@"flag"];
	[aCoder encodeInt32:self.qtyDropped forKey:@"qtyDropped"];
	[aCoder encodeInt32:self.qtyDestroyed forKey:@"qtyDestroyed"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeObject:self.items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.flag = [aDecoder decodeInt32ForKey:@"flag"];
		self.qtyDropped = [aDecoder decodeInt32ForKey:@"qtyDropped"];
		self.qtyDestroyed = [aDecoder decodeInt32ForKey:@"qtyDestroyed"];
		self.typeID= [aDecoder decodeInt32ForKey:@"typeID"];
		self.items = [aDecoder decodeObjectForKey:@"items"];
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
		self.killID = [[attributeDict valueForKey:@"killID"] intValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] intValue];
		self.killTime = [[NSDateFormatter eveDateFormatter] dateFromString:[[attributeDict valueForKey:@"killTime"] stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
		self.moonID = [[attributeDict valueForKey:@"moonID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.killID forKey:@"killID"];
	[aCoder encodeInt32:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeObject:self.killTime forKey:@"killTime"];
	[aCoder encodeInt32:self.moonID forKey:@"moonID"];
	[aCoder encodeObject:self.victim forKey:@"victim"];
	[aCoder encodeObject:self.attackers forKey:@"attackers"];
	[aCoder encodeObject:self.items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.killID = [aDecoder decodeInt32ForKey:@"killID"];
		self.solarSystemID = [aDecoder decodeInt32ForKey:@"solarSystemID"];
		self.killTime = [aDecoder decodeObjectForKey:@"killTime"];
		self.moonID = [aDecoder decodeInt32ForKey:@"moonID"];
		self.victim = [aDecoder decodeObjectForKey:@"victim"];
		self.attackers = [aDecoder decodeObjectForKey:@"attackers"];
		self.items = [aDecoder decodeObjectForKey:@"items"];
	}
	return self;
}

@end


@implementation EVEKillLog

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) killLogWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID beforeKillID: (int32_t) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEKillLog alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID beforeKillID:beforeKillID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID beforeKillID: (int32_t) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/KillLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID,
														(beforeKillID > 0 ? [NSString stringWithFormat:@"&beforeKillID=%d", beforeKillID] : @"")]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.kills forKey:@"kills"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.kills = [aDecoder decodeObjectForKey:@"kills"];
	}
	return self;
}

@end
