//
//  EVERefTypes.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVERefTypes.h"


@implementation EVERefTypesItem
@synthesize refTypeID;
@synthesize refTypeName;

+ (id) refTypesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVERefTypesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.refTypeID = [[attributeDict valueForKey:@"refTypeID"] integerValue];
		self.refTypeName = [attributeDict valueForKey:@"refTypeName"];
	}
	return self;
}

- (void) dealloc {
	[refTypeName release];
	[super dealloc];
}

@end


@implementation EVERefTypes
@synthesize refTypes;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) refTypesWithError:(NSError **)errorPtr {
	return [[[EVERefTypes alloc] initWithError:errorPtr] autorelease];
}

+ (id) refTypesWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVERefTypes alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/RefTypes.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/RefTypes.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[refTypes release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"refTypes"]) {
		refTypes = [[NSMutableArray alloc] init];
		return refTypes;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"refTypes"]) {
		EVERefTypesItem *refTypesItem = [EVERefTypesItem refTypesItemWithXMLAttributes:attributeDict];
		[object addObject:refTypesItem];
		return refTypesItem;
	}
	return nil;
}
@end