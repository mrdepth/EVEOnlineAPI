//
//  EVEJumps.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEJumps.h"


@implementation EVEJumpsItem
@synthesize solarSystemID;
@synthesize shipJumps;

+ (id) jumpsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEJumpsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.shipJumps = [[attributeDict valueForKey:@"shipJumps"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end


@implementation EVEJumps
@synthesize solarSystems;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) jumpsWithError:(NSError **)errorPtr {
	return [[[EVEJumps alloc] initWithError:errorPtr] autorelease];
}

+ (id) jumpsWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEJumps alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Jumps.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/map/Jumps.xml.aspx", EVEOnlineAPIHost]]
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
		EVEJumpsItem *jumpsItem = [EVEJumpsItem jumpsItemWithXMLAttributes:attributeDict];
		[object addObject:jumpsItem];
		return jumpsItem;
	}
	return nil;
}
@end