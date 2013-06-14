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

@interface RSSParser()
@property (nonatomic, strong) id parser;

@end


@implementation RSSParser

- (BOOL) parseXMLData:(NSData*) data {
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	xmlParser.delegate = self;
	[xmlParser setShouldProcessNamespaces:YES];
	self.feed = [[RSSFeed alloc] init];
	NSError* error = nil;
	if ([xmlParser parse]) {
	}
	else {
		error = [xmlParser parserError];
	}
	return error == nil;
}

- (BOOL) parseXMLString:(NSString*) string {
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	return [self parseXMLData:data];
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)xmlParser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	if ([elementName compare:@"RDF" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		self.parser = [[RSSParser10 alloc] init];
		[self.parser setFeed:self.feed];
		xmlParser.delegate = self.parser;
	}
	else if ([elementName compare:@"rss" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		self.parser = [[RSSParser20 alloc] init];
		[self.parser setFeed:self.feed];
		xmlParser.delegate = self.parser;
	}
	else if ([elementName compare:@"feed" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		self.parser = [[RSSParserAtom alloc] init];
		[self.parser setFeed:self.feed];
		xmlParser.delegate = self.parser;
	}
}



@end
