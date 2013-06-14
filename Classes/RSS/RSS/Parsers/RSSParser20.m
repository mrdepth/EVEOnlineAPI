//
//  RSSParser20.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParser20.h"
#import "NSMutableString+RSSParser10.h"

@interface RSSParser20()
@property (nonatomic, strong) NSMutableString *text;
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end


@implementation RSSParser20

- (id) init {
	if (self = [super init]) {
		self.stack = [[NSMutableArray alloc] init];
		self.text = [[NSMutableString alloc] init];
		
		self.dateFormatter = [[NSDateFormatter alloc] init];
		[self.dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZZ"];
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	[self.text setString:@""];
	id object = [self.stack lastObject];

	if ([elementName compare:@"channel" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[self.stack addObject:self.feed];
	}
	else if ([elementName compare:@"image" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSImage *image = [[RSSImage alloc] init];
		self.feed.image = image;
		[self.stack addObject:image];
	}
	else if ([elementName compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSItem *item = [[RSSItem alloc] init];
		[self.feed.items addObject:item];
		[self.stack addObject:item];
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSSource *source = [[RSSSource alloc] init];
		if ([object respondsToSelector:@selector(setSource:)])
			[object setSource:source];
		source.url = [NSURL URLWithString:[attributeDict valueForKey:@"url"]];
		[self.stack addObject:source];
	}
	else if ([elementName compare:@"enclosure" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSEnclosure *enclosure = [[RSSEnclosure alloc] init];
		if ([object respondsToSelector:@selector(setEnclosure:)])
			[object setEnclosure:enclosure];
		enclosure.url = [NSURL URLWithString:[attributeDict valueForKey:@"url"]];
		enclosure.length = [[attributeDict valueForKey:@"length"] integerValue];
		enclosure.type = [attributeDict valueForKey:@"type"];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	id object = [self.stack lastObject];
	[self.text removeSpaces];
	if ([elementName compare:@"title" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setTitle:)])
			[object setTitle:self.text];
	}
	else if ([elementName compare:@"link" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setLink:)])
			[object setLink:[NSURL URLWithString:self.text]];
	}
	else if ([elementName compare:@"description" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)])
			[object setDescription:self.text];
	}
	else if ([elementName compare:@"language" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setLanguage:)])
			[object setLanguage:self.text];
	}
	else if ([elementName compare:@"copyright" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCopyright:)])
			[object setCopyright:self.text];
	}
	else if ([elementName compare:@"url" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUrl:)])
			[object setUrl:[NSURL URLWithString:self.text]];
	}
	else if ([elementName compare:@"image" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[self.stack removeLastObject];
	}
	else if ([elementName compare:@"category" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCategory:)])
			[object setCategory:self.text];
	}
	else if ([elementName compare:@"author" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setAuthor:)])
			[object setAuthor:self.text];
	}
	else if ([elementName compare:@"guid" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setGuid:)])
			[object setGuid:self.text];
	}
	else if ([elementName compare:@"pubDate" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUpdated:)]) {
			NSDate *date = [self.dateFormatter dateFromString:self.text];
			[object setUpdated:date];
		}
	}
	else if ([elementName compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[self.stack removeLastObject];
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setTitle:)])
			[object setTitle:self.text];
		[self.stack removeLastObject];
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[self.text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *string = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[self.text appendString:string];
}

@end