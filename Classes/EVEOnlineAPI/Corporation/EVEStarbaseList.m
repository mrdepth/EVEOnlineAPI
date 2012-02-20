//
//  EVEStarbaseList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStarbaseList.h"


@implementation EVEStarbaseListItem
@synthesize itemID;
@synthesize typeID;
@synthesize locationID;
@synthesize moonID;
@synthesize state;
@synthesize stateTimestamp;
@synthesize onlineTimestamp;

+ (id) starbaseListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEStarbaseListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
		self.moonID = [[attributeDict valueForKey:@"moonID"] longLongValue];
		self.state = (EVEPOSState) [[attributeDict valueForKey:@"state"] integerValue];
		self.stateTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"stateTimestamp"]];
		self.onlineTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"onlineTimestamp"]];
	}
	return self;
}

- (void) dealloc {
	[stateTimestamp release];
	[onlineTimestamp release];
	[super dealloc];
}

@end


@implementation EVEStarbaseList
@synthesize starbases;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEStarbaseList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEStarbaseList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/StarbaseList.xml.aspx?keyID=%d&vCode=%@&characterID=%d&version=2", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/StarbaseList.xml.aspx?keyID=%d&vCode=%@&characterID=%d&version=2", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[starbases release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"starbases"]) {
		starbases = [[NSMutableArray alloc] init];
		return starbases;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"starbases"]) {
		EVEStarbaseListItem *starbaseListItem = [EVEStarbaseListItem starbaseListItemWithXMLAttributes:attributeDict];
		[starbases addObject:starbaseListItem];
		return starbaseListItem;
	}
	return nil;
}

@end