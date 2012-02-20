//
//  EVEAccountStatus.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAccountStatus.h"


@implementation EVEAccountStatus
@synthesize paidUntil;
@synthesize createDate;
@synthesize logonCount;
@synthesize logonMinutes;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) accountStatusWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr {
	return [[[EVEAccountStatus alloc] initWithKeyID:keyID vCode:vCode error:errorPtr] autorelease];
}

+ (id) accountStatusWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEAccountStatus alloc] initWithKeyID:keyID vCode:vCode target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/AccountStatus.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, vCode]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/AccountStatus.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, vCode]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}


- (void) dealloc {
	[paidUntil release];
	[createDate release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

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
@end