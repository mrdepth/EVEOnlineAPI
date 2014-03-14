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
		self.itemTypeID = [[attributeDict valueForKey:@"itemTypeID"] intValue];
		self.actorID = [[attributeDict valueForKey:@"actorID"] intValue];
		self.actorName = [attributeDict valueForKey:@"actorName"];
		self.flag = (EVEInventoryFlag) [[attributeDict valueForKey:@"flag"] intValue];
		self.locationID = [[attributeDict valueForKey:@"locationID"] intValue];
		self.action = [attributeDict valueForKey:@"action"];
		self.passwordType = [attributeDict valueForKey:@"passwordType"];
		self.typeID = (EVEInventoryFlag) [[attributeDict valueForKey:@"typeID"] intValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] intValue];
		self.oldConfiguration = [attributeDict valueForKey:@"oldConfiguration"];
		self.theNewConfiguration = [attributeDict valueForKey:@"newConfiguration"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.logTime forKey:@"logTime"];
	[aCoder encodeInt64:self.itemID forKey:@"itemID"];
	
	[aCoder encodeInt32:self.itemTypeID forKey:@"itemTypeID"];
	[aCoder encodeInt32:self.actorID forKey:@"actorID"];

	[aCoder encodeObject:self.actorName forKey:@"actorName"];
	[aCoder encodeInt32:self.flag forKey:@"flag"];
	[aCoder encodeInt32:self.locationID forKey:@"locationID"];

	[aCoder encodeObject:self.action forKey:@"action"];
	[aCoder encodeObject:self.passwordType forKey:@"passwordType"];

	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.quantity forKey:@"quantity"];
	[aCoder encodeObject:self.oldConfiguration forKey:@"oldConfiguration"];
	[aCoder encodeObject:self.theNewConfiguration forKey:@"theNewConfiguration"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.logTime = [aDecoder decodeObjectForKey:@"logTime"];
		self.itemID = [aDecoder decodeInt64ForKey:@"itemID"];
		
		self.itemTypeID = [aDecoder decodeInt32ForKey:@"itemTypeID"];
		self.actorID = [aDecoder decodeInt32ForKey:@"actorID"];

		self.actorName = [aDecoder decodeObjectForKey:@"actorName"];
		self.flag = [aDecoder decodeInt32ForKey:@"flag"];
		self.locationID = [aDecoder decodeInt32ForKey:@"locationID"];
		
		self.action = [aDecoder decodeObjectForKey:@"action"];
		self.passwordType = [aDecoder decodeObjectForKey:@"passwordType"];

		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.quantity = [aDecoder decodeInt32ForKey:@"quantity"];
		self.oldConfiguration = [aDecoder decodeObjectForKey:@"oldConfiguration"];
		self.theNewConfiguration = [aDecoder decodeObjectForKey:@"theNewConfiguration"];
	}
	return self;
}

@end


@implementation EVEContainerLog

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) containerLogWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContainerLog alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContainerLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.containerLog forKey:@"containerLog"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.containerLog = [aDecoder decodeObjectForKey:@"containerLog"];
	}
	return self;
}

@end