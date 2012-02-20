//
//  EVEErrorList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEErrorList.h"


@implementation EVEErrorListItem
@synthesize errorCode;
@synthesize errorText;

+ (id) errorListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEErrorListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.errorCode = [[attributeDict valueForKey:@"errorCode"] integerValue];
		self.errorText = [attributeDict valueForKey:@"errorText"];
	}
	return self;
}

- (void) dealloc {
	[errorText release];
	[super dealloc];
}

@end


@implementation EVEErrorList
@synthesize errors;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) errorListWithError:(NSError **)errorPtr {
	return [[[EVEErrorList alloc] initWithError:errorPtr] autorelease];
}

+ (id) errorListWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEErrorList alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ErrorList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ErrorList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[errors release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"errors"]) {
		errors = [[NSMutableArray alloc] init];
		return errors;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"errors"]) {
		EVEErrorListItem *errorListItem = [EVEErrorListItem errorListItemWithXMLAttributes:attributeDict];
		[object addObject:errorListItem];
		return errorListItem;
	}
	return nil;
}
@end