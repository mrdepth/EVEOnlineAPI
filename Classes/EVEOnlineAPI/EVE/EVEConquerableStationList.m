//
//  EVEConquerableStationList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEConquerableStationList.h"


@implementation EVEConquerableStationListItem
@synthesize stationID;
@synthesize stationName;
@synthesize stationTypeID;
@synthesize solarSystemID;
@synthesize corporationID;
@synthesize corporationName;

+ (id) conquerableStationListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEConquerableStationListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.stationTypeID = [[attributeDict valueForKey:@"stationTypeID"] integerValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
	}
	return self;
}

- (void) dealloc {
	[stationName release];
	[corporationName release];
	[super dealloc];
}

@end


@implementation EVEConquerableStationList
@synthesize outposts;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) conquerableStationListWithError:(NSError **)errorPtr {
	return [[[EVEConquerableStationList alloc] initWithError:errorPtr] autorelease];
}

+ (id) conquerableStationListWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEConquerableStationList alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ConquerableStationList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ConquerableStationList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[outposts release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"outposts"]) {
		outposts = [[NSMutableArray alloc] init];
		return outposts;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"outposts"]) {
		EVEConquerableStationListItem *conquerableStationListItem = [EVEConquerableStationListItem conquerableStationListItemWithXMLAttributes:attributeDict];
		[object addObject:conquerableStationListItem];
		return conquerableStationListItem;
	}
	return nil;
}
@end