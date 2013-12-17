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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.groupID forKey:@"groupID"];
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:self.description forKey:@"description"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.groupID = [aDecoder decodeIntegerForKey:@"groupID"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.accessMask forKey:@"accessMask"];
	[aCoder encodeInteger:self.type forKey:@"type"];
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeInteger:self.groupID forKey:@"groupID"];
	[aCoder encodeObject:self.description forKey:@"description"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.accessMask = [aDecoder decodeIntegerForKey:@"accessMask"];
		self.type = [aDecoder decodeIntegerForKey:@"type"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.groupID = [aDecoder decodeIntegerForKey:@"groupID"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
	}
	return self;
}

@end


@implementation EVECalllist

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}


+ (id) calllistWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECalllist alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/calllist.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.callGroups forKey:@"callGroups"];
	[aCoder encodeObject:self.calls forKey:@"calls"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.callGroups = [aDecoder decodeObjectForKey:@"callGroups"];
		self.calls = [aDecoder decodeObjectForKey:@"calls"];
	}
	return self;
}

@end