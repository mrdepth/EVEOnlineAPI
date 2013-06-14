//
//  EVEContainerLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContainerLog.h"


@implementation EVEContainerLogItem

+ (id) containerLogItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEContainerLogItem alloc] initWithXMLAttributes:attributeDict];
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

@end


@implementation EVEContainerLog

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) containerLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEContainerLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContainerLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"containerLog"]) {
		self.containerLog = [[NSMutableArray alloc] init];
		return self.containerLog;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"containerLog"]) {
		EVEContainerLogItem *containerLogItem = [EVEContainerLogItem containerLogItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.containerLog addObject:containerLogItem];
		return containerLogItem;
	}
	return nil;
}
@end