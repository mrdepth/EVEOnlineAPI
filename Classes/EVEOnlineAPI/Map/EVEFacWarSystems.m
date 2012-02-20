//
//  EVEFacWarSystems.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEFacWarSystems.h"


@implementation EVEFacWarSystemsItem
@synthesize solarSystemID;
@synthesize solarSystemName;
@synthesize occupyingFactionID;
@synthesize occupyingFactionName;
@synthesize contested;

+ (id) facWarSystemsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEFacWarSystemsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.occupyingFactionID = [[attributeDict valueForKey:@"occupyingFactionID"] integerValue];
		self.occupyingFactionName = [attributeDict valueForKey:@"occupyingFactionName"];
		self.contested = [[attributeDict valueForKey:@"contested"] compare:@"True" options:NSCaseInsensitiveSearch] == NSOrderedSame ? TRUE : FALSE;
	}
	return self;
}

- (void) dealloc {
	[solarSystemName release];
	[occupyingFactionName release];
	[super dealloc];
}

@end


@implementation EVEFacWarSystems
@synthesize solarSystems;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) facWarSystemsWithError:(NSError **)errorPtr {
	return [[[EVEFacWarSystems alloc] initWithError:errorPtr] autorelease];
}

+ (id) facWarSystemsWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEFacWarSystems alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/FacWarSystems.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/FacWarSystems.xml.aspx", EVEOnlineAPIHost]]
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
		EVEFacWarSystemsItem *facWarSystemsItem = [EVEFacWarSystemsItem facWarSystemsItemWithXMLAttributes:attributeDict];
		[object addObject:facWarSystemsItem];
		return facWarSystemsItem;
	}
	return nil;
}
@end