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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.allianceName forKey:@"allianceName"];
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	[aCoder encodeInteger:self.damageTaken forKey:@"damageTaken"];
	[aCoder encodeInteger:self.factionID forKey:@"factionID"];
	[aCoder encodeObject:self.factionName forKey:@"factionName"];
	[aCoder encodeInteger:self.shipTypeID forKey:@"shipTypeID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.allianceID = [aDecoder decodeIntegerForKey:@"allianceID"];
		self.allianceName = [aDecoder decodeObjectForKey:@"allianceName"];
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		self.damageTaken = [aDecoder decodeIntegerForKey:@"damageTaken"];
		self.factionID = [aDecoder decodeIntegerForKey:@"factionID"];
		self.factionName = [aDecoder decodeObjectForKey:@"factionName"];
		self.shipTypeID = [aDecoder decodeIntegerForKey:@"shipTypeID"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.allianceName forKey:@"allianceName"];
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	
	[aCoder encodeFloat:self.securityStatus forKey:@"securityStatus"];
	[aCoder encodeInteger:self.damageDone forKey:@"damageDone"];
	[aCoder encodeBool:self.finalBlow forKey:@"finalBlow"];
	[aCoder encodeInteger:self.weaponTypeID forKey:@"weaponTypeID"];
	[aCoder encodeInteger:self.shipTypeID forKey:@"shipTypeID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.allianceID = [aDecoder decodeIntegerForKey:@"allianceID"];
		self.allianceName = [aDecoder decodeObjectForKey:@"allianceName"];
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		
		self.securityStatus = [aDecoder decodeFloatForKey:@"securityStatus"];
		self.damageDone = [aDecoder decodeIntegerForKey:@"damageDone"];
		self.finalBlow = [aDecoder decodeBoolForKey:@"finalBlow"];
		self.weaponTypeID = [aDecoder decodeIntegerForKey:@"weaponTypeID"];
		self.shipTypeID = [aDecoder decodeIntegerForKey:@"shipTypeID"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.flag forKey:@"flag"];
	[aCoder encodeInteger:self.qtyDropped forKey:@"qtyDropped"];
	[aCoder encodeInteger:self.qtyDestroyed forKey:@"qtyDestroyed"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeObject:self.items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.flag = [aDecoder decodeIntegerForKey:@"flag"];
		self.qtyDropped = [aDecoder decodeIntegerForKey:@"qtyDropped"];
		self.qtyDestroyed = [aDecoder decodeIntegerForKey:@"qtyDestroyed"];
		self.typeID= [aDecoder decodeIntegerForKey:@"typeID"];
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
		self.killID = [[attributeDict valueForKey:@"killID"] integerValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.killTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"killTime"]];
		self.moonID = [[attributeDict valueForKey:@"moonID"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.killID forKey:@"killID"];
	[aCoder encodeInteger:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeObject:self.killTime forKey:@"killTime"];
	[aCoder encodeInteger:self.moonID forKey:@"moonID"];
	[aCoder encodeObject:self.victim forKey:@"victim"];
	[aCoder encodeObject:self.attackers forKey:@"attackers"];
	[aCoder encodeObject:self.items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.killID = [aDecoder decodeIntegerForKey:@"killID"];
		self.solarSystemID = [aDecoder decodeIntegerForKey:@"solarSystemID"];
		self.killTime = [aDecoder decodeObjectForKey:@"killTime"];
		self.moonID = [aDecoder decodeIntegerForKey:@"moonID"];
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

+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEKillLog alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID beforeKillID:beforeKillID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
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
