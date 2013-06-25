//
//  EVECalllist.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECalllist.h"


@implementation EVECalllistCallGroupsItem

+ (id) callGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECalllistCallGroupsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.groupID = [[attributeDict valueForKey:@"groupID"] integerValue];
		self.name = [attributeDict valueForKey:@"name"];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

@end


@implementation EVECalllistCallsItem

+ (id) callsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECalllistCallsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.accessMask = [[attributeDict valueForKey:@"accessMask"] integerValue];
		self.type = [[attributeDict valueForKey:@"type"] isEqualToString:@"Character"] ? EVECallTypeCharacter : EVECallTypeCorporation;
		self.name = [attributeDict valueForKey:@"name"];
		self.groupID = [[attributeDict valueForKey:@"groupID"] integerValue];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

@end


@implementation EVECalllist

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}


+ (id) calllistWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECalllist alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/calllist.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"callGroups"]) {
		self.callGroups = [[NSMutableArray alloc] init];
		return self.callGroups;
	}
	else if ([rowset isEqualToString:@"calls"]) {
		self.calls = [[NSMutableArray alloc] init];
		return self.calls;
	}
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"callGroups"]) {
		EVECalllistCallGroupsItem *callGroup = [EVECalllistCallGroupsItem callGroupsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.callGroups addObject:callGroup];
		return callGroup;
	}
	else if ([rowset isEqualToString:@"calls"]) {
		EVECalllistCallsItem *call = [EVECalllistCallsItem callsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.calls addObject:call];
		return call;
	}
	else
		return nil;
}


@end