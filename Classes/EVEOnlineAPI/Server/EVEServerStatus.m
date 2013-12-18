//
//  EVEServerStatus.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEServerStatus.h"


@implementation EVEServerStatus

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) serverStatusWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEServerStatus alloc] initWithCachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/server/ServerStatus.xml.aspx", EVEOnlineAPIHost]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeBool:self.serverOpen forKey:@"serverOpen"];
	[aCoder encodeInteger:self.onlinePlayers forKey:@"onlinePlayers"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.serverOpen = [aDecoder decodeBoolForKey:@"serverOpen"];
		self.onlinePlayers = [aDecoder decodeIntegerForKey:@"onlinePlayers"];
	}
	return self;
}

@end