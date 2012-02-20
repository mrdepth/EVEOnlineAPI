//
//  RSSParser20.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParser20.h"
#import "NSMutableString+RSSParser10.h"

@implementation RSSParser20
@synthesize feed;

- (id) init {
	if (self = [super init]) {
		stack = [[NSMutableArray alloc] init];
		text = [[NSMutableString alloc] init];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZZ"];
	}
	return self;
}

- (void) dealloc {
	[text release];
	[feed release];
	[stack release];
	[dateFormatter release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	[text setString:@""];
	id object = [stack lastObject];

	if ([elementName compare:@"channel" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[stack addObject:feed];
	}
	else if ([elementName compare:@"image" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSImage *image = [[RSSImage alloc] init];
		feed.image = image;
		[stack addObject:image];
		[image release];
	}
	else if ([elementName compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSItem *item = [[RSSItem alloc] init];
		[feed.items addObject:item];
		[stack addObject:item];
		[item release];
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSSource *source = [[RSSSource alloc] init];
		if ([object respondsToSelector:@selector(setSource:)])
			[object setSource:source];
		source.url = [NSURL URLWithString:[attributeDict valueForKey:@"url"]];
		[stack addObject:source];
		[source release];
	}
	else if ([elementName compare:@"enclosure" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSEnclosure *enclosure = [[RSSEnclosure alloc] init];
		if ([object respondsToSelector:@selector(setEnclosure:)])
			[object setEnclosure:enclosure];
		enclosure.url = [NSURL URLWithString:[attributeDict valueForKey:@"url"]];
		enclosure.length = [[attributeDict valueForKey:@"length"] integerValue];
		enclosure.type = [attributeDict valueForKey:@"type"];
		[enclosure release];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	id object = [stack lastObject];
	[text removeSpaces];
	if ([elementName compare:@"title" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setTitle:)])
			[object setTitle:text];
	}
	else if ([elementName compare:@"link" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setLink:)])
			[object setLink:[NSURL URLWithString:text]];
	}
	else if ([elementName compare:@"description" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)])
			[object setDescription:text];
	}
	else if ([elementName compare:@"language" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setLanguage:)])
			[object setLanguage:text];
	}
	else if ([elementName compare:@"copyright" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCopyright:)])
			[object setCopyright:text];
	}
	else if ([elementName compare:@"url" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUrl:)])
			[object setUrl:[NSURL URLWithString:text]];
	}
	else if ([elementName compare:@"image" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[stack removeLastObject];
	}
	else if ([elementName compare:@"category" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCategory:)])
			[object setCategory:text];
	}
	else if ([elementName compare:@"author" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setAuthor:)])
			[object setAuthor:text];
	}
	else if ([elementName compare:@"guid" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setGuid:)])
			[object setGuid:text];
	}
	else if ([elementName compare:@"pubDate" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUpdated:)]) {
			NSDate *date = [dateFormatter dateFromString:text];
			[object setUpdated:date];
		}
	}
	else if ([elementName compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[stack removeLastObject];
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setTitle:)])
			[object setTitle:text];
		[stack removeLastObject];
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *string = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[text appendString:string];
	[string release];
}

@end