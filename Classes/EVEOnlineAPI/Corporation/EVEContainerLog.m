//
//  EVEContainerLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContainerLog.h"


@implementation EVEContainerLogItem

@synthesize logTime;
@synthesize itemID;
@synthesize itemTypeID;
@synthesize actorID;
@synthesize actorName;
@synthesize flag;
@synthesize locationID;
@synthesize action;
@synthesize passwordType;
@synthesize typeID;
@synthesize quantity;
@synthesize oldConfiguration;
@synthesize theNewConfiguration;

+ (id) containerLogItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEContainerLogItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.logTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"logTime"]];
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		self.itemTypeID = [[attributeDict valueForKey:@"itemTypeID"] integerValue];
		self.actorID = [[attributeDict valueForKey:@"actorID"] integerValue];
		self.actorName = [attributeDict valueForKey:@"actorName"];
		self.flag = (EVEInventoryFlag) [[attributeDict valueForKey:@"flag"] integerValue];
		self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
		self.action = [attributeDict valueForKey:@"action"];
		self.passwordType = [attributeDict valueForKey:@"passwordType"];
		self.typeID = (EVEInventoryFlag) [[attributeDict valueForKey:@"typeID"] integerValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] integerValue];
		self.oldConfiguration = [attributeDict valueForKey:@"oldConfiguration"];
		self.theNewConfiguration = [attributeDict valueForKey:@"newConfiguration"];
	}
	return self;
}

- (void) dealloc {
	[logTime release];
	[actorName release];
	[action release];
	[passwordType release];
	[oldConfiguration release];
	[theNewConfiguration release];
	[super dealloc];
}

@end


@implementation EVEContainerLog
@synthesize containerLog;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) containerLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEContainerLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) containerLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEContainerLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContainerLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContainerLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[containerLog release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"containerLog"]) {
		containerLog = [[NSMutableArray alloc] init];
		return containerLog;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"containerLog"]) {
		EVEContainerLogItem *containerLogItem = [EVEContainerLogItem containerLogItemWithXMLAttributes:attributeDict];
		[containerLog addObject:containerLogItem];
		return containerLogItem;
	}
	return nil;
}
@end