//
//  EVEStandings.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStandings.h"

@implementation EVEStandingsItem
@synthesize fromID;
@synthesize fromName;
@synthesize standing;

+ (id) standingsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEStandingsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.fromID = [[attributeDict valueForKey:@"fromID"] integerValue];
		self.fromName = [attributeDict valueForKey:@"fromName"];
		self.standing = [[attributeDict valueForKey:@"standing"] floatValue];
	}
	return self;
}

- (void) dealloc {
	[fromName release];
	[super dealloc];
}

@end


@implementation EVEStandingsNPCStandings
@synthesize agents;
@synthesize NPCCorporations;
@synthesize factions;

- (void) dealloc {
	[agents release];
	[NPCCorporations release];
	[factions release];
	[super dealloc];
}

@end

@implementation EVEStandings
@synthesize standings;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEStandings alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEStandings alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Standings.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") , keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Standings.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") , keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[standings release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if (!standings)
		self.standings = [[[EVEStandingsNPCStandings alloc] init] autorelease];
	if ([rowset isEqualToString:@"agents"]) {
		standings.agents = [[[NSMutableArray alloc] init] autorelease];
		return standings.agents;
	}
	else if ([rowset isEqualToString:@"NPCCorporations"]) {
		standings.NPCCorporations = [[[NSMutableArray alloc] init] autorelease];
		return standings.NPCCorporations;
	}
	else if ([rowset isEqualToString:@"factions"]) {
		standings.factions = [[[NSMutableArray alloc] init] autorelease];
		return standings.factions;
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