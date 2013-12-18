//
//  EVEAccountStatus.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAccountStatus.h"


@implementation EVEAccountStatus

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) accountStatusWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEAccountStatus alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/AccountStatus.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
		
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	return nil;
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"paidUntil"])
		self.paidUntil = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"createDate"])
		self.createDate = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"logonCount"])
		self.logonCount = [self.text integerValue];
	else if ([elementName isEqualToString:@"logonMinutes"])
		self.logonMinutes = [self.text integerValue];

}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.paidUntil forKey:@"paidUntil"];
	[aCoder encodeObject:self.createDate forKey:@"createDate"];
	[aCoder encodeInteger:self.logonCount forKey:@"logonCount"];
	[aCoder encodeInteger:self.logonMinutes forKey:@"logonMinutes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.paidUntil = [aDecoder decodeObjectForKey:@"paidUntil"];
		self.createDate = [aDecoder decodeObjectForKey:@"createDate"];
		self.logonCount = [aDecoder decodeIntegerForKey:@"logonCount"];
		self.logonMinutes = [aDecoder decodeIntegerForKey:@"logonMinutes"];
	}
	return self;
}

@end