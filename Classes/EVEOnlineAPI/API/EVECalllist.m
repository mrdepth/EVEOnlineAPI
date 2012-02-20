//
//  EVECalllist.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECalllist.h"


@implementation EVECalllistCallGroupsItem
@synthesize groupID;
@synthesize name;
@synthesize description;

+ (id) callGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECalllistCallGroupsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.groupID = [[attributeDict valueForKey:@"groupID"] integerValue];
		self.name = [attributeDict valueForKey:@"name"];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

- (void) dealloc {
	[name release];
	[description release];
	[super dealloc];
}

@end


@implementation EVECalllistCallsItem
@synthesize accessMask;
@synthesize type;
@synthesize name;
@synthesize groupID;
@synthesize description;

+ (id) callsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECalllistCallsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[name release];
	[description release];
	[super dealloc];
}

@end


@implementation EVECalllist
@synthesize callGroups;
@synthesize calls;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}


+ (id) calllistWithError:(NSError **)errorPtr {
	return [[[EVECalllist alloc] initWithError:errorPtr] autorelease];
}

+ (id) calllistWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVECalllist alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/calllist.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/api/calllist.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[callGroups release];
	[calls release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"callGroups"]) {
		callGroups = [[NSMutableArray alloc] init];
		return callGroups;
	}
	else if ([rowset isEqualToString:@"calls"]) {
		calls = [[NSMutableArray alloc] init];
		return calls;
	}
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"callGroups"]) {
		EVECalllistCallGroupsItem *callGroup = [EVECalllistCallGroupsItem callGroupsItemWithXMLAttributes:attributeDict];
		[callGroups addObject:callGroup];
		return callGroup;
	}
	else if ([rowset isEqualToString:@"calls"]) {
		EVECalllistCallsItem *call = [EVECalllistCallsItem callsItemWithXMLAttributes:attributeDict];
		[calls addObject:call];
		return call;
	}
	else
		return nil;
}


@end