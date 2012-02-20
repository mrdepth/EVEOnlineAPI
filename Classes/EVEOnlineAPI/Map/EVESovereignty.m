//
//  EVESovereignty.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESovereignty.h"


@implementation EVESovereigntyItem
@synthesize solarSystemID;
@synthesize allianceID;
@synthesize factionID;
@synthesize solarSystemName;
@synthesize corporationID;

+ (id) sovereigntyItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVESovereigntyItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.allianceID = [[attributeDict valueForKey:@"allianceID"] integerValue];
		self.factionID = [[attributeDict valueForKey:@"factionID"] integerValue];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[solarSystemName release];
	[super dealloc];
}

@end


@implementation EVESovereignty
@synthesize solarSystems;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) sovereigntyWithError:(NSError **)errorPtr {
	return [[[EVESovereignty alloc] initWithError:errorPtr] autorelease];
}

+ (id) sovereigntyWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVESovereignty alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Sovereignty.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Sovereignty.xml.aspx", EVEOnlineAPIHost]]
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

- (void) cacheData {
	self.cachedUntil = [self.currentTime dateByAddingTimeInterval:3600 * 24];
	[super cacheData];
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
		EVESovereigntyItem *sovereigntyItem = [EVESovereigntyItem sovereigntyItemWithXMLAttributes:attributeDict];
		[object addObject:sovereigntyItem];
		return sovereigntyItem;
	}
	return nil;
}
@end