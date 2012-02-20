//
//  EVEKillLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEKillLog.h"

@implementation EVEKillLogVictim
@synthesize allianceID;
@synthesize allianceName;
@synthesize characterID;
@synthesize characterName;
@synthesize corporationID;
@synthesize corporationName;
@synthesize damageTaken;
@synthesize factionID;
@synthesize factionName;
@synthesize shipTypeID;

+ (id) killLogVictimWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEKillLogVictim alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[allianceName release];
	[characterName release];
	[corporationName release];
	[factionName release];
	[super dealloc];
}

@end


@implementation EVEKillLogAttacker
@synthesize characterID;
@synthesize characterName;
@synthesize corporationID;
@synthesize corporationName;
@synthesize allianceID;
@synthesize allianceName;
@synthesize securityStatus;
@synthesize damageDone;
@synthesize finalBlow;
@synthesize weaponTypeID;
@synthesize shipTypeID;


+ (id) killLogAttackerWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEKillLogAttacker alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[characterName release];
	[corporationName release];
	[allianceName release];
	[super dealloc];
}

@end

@implementation EVEKillLogItem
@synthesize flag;
@synthesize qtyDropped;
@synthesize qtyDestroyed;
@synthesize typeID;
@synthesize items;

+ (id) killLogItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEKillLogItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[items release];
	[super dealloc];
}

@end

@implementation EVEKillLogKill
@synthesize killID;
@synthesize solarSystemID;
@synthesize killTime;
@synthesize moonID;
@synthesize victim;
@synthesize attackers;
@synthesize items;

+ (id) killLogKillWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEKillLogKill alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[killTime release];
	[victim release];
	[attackers release];
	[items release];
	[super dealloc];
}

@end


@implementation EVEKillLog
@synthesize kills;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEKillLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeKillID:beforeKillID corporate:corporate error:errorPtr] autorelease];
}

+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEKillLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeKillID:beforeKillID corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/KillLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID,
														(beforeKillID > 0 ? [NSString stringWithFormat:@"&beforeKillID=%d", beforeKillID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/KillLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID,
														(beforeKillID > 0 ? [NSString stringWithFormat:@"&beforeKillID=%d", beforeKillID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[kills release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"kills"]) {
		kills = [[NSMutableArray alloc] init];
		return kills;
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
		[kills addObject:kill];
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
