//
//  EVELocations.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVELocations.h"

@implementation EVELocationsItem
@synthesize itemID;
@synthesize itemName;
@synthesize x;
@synthesize y;
@synthesize z;

+ (id) locationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVELocationsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		self.itemName = [attributeDict valueForKey:@"itemName"];
		self.x = [[attributeDict valueForKey:@"x"] floatValue];
		self.y = [[attributeDict valueForKey:@"y"] floatValue];
		self.z = [[attributeDict valueForKey:@"z"] floatValue];
	}
	return self;
}

- (void) dealloc {
	[itemName release];
	[super dealloc];
}

@end


@implementation EVELocations
@synthesize locations;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) locationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVELocations alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids corporate:corporate error:errorPtr] autorelease];
}

+ (id) locationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVELocations alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr {
/*	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Locations.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@",
														EVEOnlineAPIHost,
														(corporate ? @"corp" : @"char"),
														keyID,
														vCode,
														characterID,
														[ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;*/
	NSString* body = [NSString stringWithFormat:@"keyID=%d&vCode=%@&characterID=%d&ids=%@",
					  keyID,
					  vCode,
					  characterID,
					  [ids componentsJoinedByString:@","]];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Locations.xml.aspx",
														EVEOnlineAPIHost,
														(corporate ? @"corp" : @"char")]]
						 bodyData:[body dataUsingEncoding:NSUTF8StringEncoding]
					  contentType:nil
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
		
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Locations.xml.aspx?keyID=%d&vCode=%@&characterID=%d",
														EVEOnlineAPIHost,
														(corporate ? @"corp" : @"char"),
														keyID,
														vCode,
														characterID,
														[ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[locations release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"locations"]) {
		locations = [[NSMutableArray alloc] init];
		return locations;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"locations"]) {
		EVELocationsItem *location = [EVELocationsItem locationsItemWithXMLAttributes:attributeDict];
		[locations addObject:location];
		return location;
	}
	return nil;
}

@end