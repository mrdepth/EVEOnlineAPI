//
//  RSSParser.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParser.h"
#import "RSSParser10.h"
#import "RSSParser20.h"
#import "RSSParserAtom.h"


@implementation RSSParser
@synthesize feed;
@synthesize error;

- (void) dealloc {
	[feed release];
	[error release];
	[super dealloc];
}

- (BOOL) parseXMLData:(NSData*) data {
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	xmlParser.delegate = self;
	[xmlParser setShouldProcessNamespaces:YES];
	[feed release];
	feed = [[RSSFeed alloc] init];
	if ([xmlParser parse]) {
	}
	else {
		[error release];
		error = [[xmlParser parserError] retain];
	}
	[xmlParser release];
	return error == nil;
}

- (BOOL) parseXMLString:(NSString*) string {
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	return [self parseXMLData:data];
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)xmlParser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	if ([elementName compare:@"RDF" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		parser = [[RSSParser10 alloc] init];
		[parser setFeed:self.feed];
		xmlParser.delegate = parser;
	}
	else if ([elementName compare:@"rss" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		parser = [[RSSParser20 alloc] init];
		[parser setFeed:self.feed];
		xmlParser.delegate = parser;
	}
	else if ([elementName compare:@"feed" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		parser = [[RSSParserAtom alloc] init];
		[parser setFeed:self.feed];
		xmlParser.delegate = parser;
	}
}



@end
