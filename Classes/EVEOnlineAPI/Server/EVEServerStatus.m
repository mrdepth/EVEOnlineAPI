//
//  EVEServerStatus.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEServerStatus.h"


@implementation EVEServerStatus
@synthesize serverOpen;
@synthesize onlinePlayers;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) serverStatusWithError:(NSError **)errorPtr {
	return [[[EVEServerStatus alloc] initWithError:errorPtr] autorelease];
}

+ (id) serverStatusWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEServerStatus alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/server/ServerStatus.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/server/ServerStatus.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"serverOpen"])
		self.serverOpen = [self.text compare:@"True" options:NSCaseInsensitiveSearch] == NSOrderedSame ? TRUE : FALSE;
	else if ([elementName isEqualToString:@"onlinePlayers"])
		self.onlinePlayers = [self.text integerValue];
}

@end