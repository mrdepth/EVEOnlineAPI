//
//  EVEKills.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEKills.h"


@implementation EVEKillsItem
@synthesize solarSystemID;
@synthesize shipKills;
@synthesize factionKills;
@synthesize podKills;

+ (id) killsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEKillsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.shipKills = [[attributeDict valueForKey:@"shipKills"] integerValue];
		self.factionKills = [[attributeDict valueForKey:@"factionKills"] integerValue];
		self.podKills = [[attributeDict valueForKey:@"podKills"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end


@implementation EVEKills
@synthesize solarSystems;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) killsWithError:(NSError **)errorPtr {
	return [[[EVEKills alloc] initWithError:errorPtr] autorelease];
}

+ (id) killsWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEKills alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Kills.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Kills.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[solarSystems release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"solarSystems"]) {
		solarSystems = [[NSMutableArray alloc] init];
		return solarSystems;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"solarSystems"]) {
		EVEKillsItem *killsItem = [EVEKillsItem killsItemWithXMLAttributes:attributeDict];
		[object addObject:killsItem];
		return killsItem;
	}
	return nil;
}
@end