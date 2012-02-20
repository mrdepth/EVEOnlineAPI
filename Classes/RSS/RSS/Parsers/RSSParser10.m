//
//  RSSParser10.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParser10.h"
#import "NSMutableString+RSSParser10.h"

@implementation RSSParser10
@synthesize feed;

- (id) init {
	if (self = [super init]) {
		stack = [[NSMutableArray alloc] init];
		text = [[NSMutableString alloc] init];
		dateFormatters = [[NSMutableArray alloc] init];

		NSDateFormatter *dateFormatter;
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmZZZ"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];

		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmssZZZ"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];

		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmss.SZZZ"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];
	}
	return self;
}

- (void) dealloc {
	[text release];
	[feed release];
	[stack release];
	[dateFormatters release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	[text setString:@""];
	
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
	else if ([elementName compare:@"url" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUrl:)])
			[object setUrl:[NSURL URLWithString:text]];
	}
	else if ([elementName compare:@"image" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[stack removeLastObject];
	}
	else if ([elementName compare:@"creator" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setAuthor:)])
			[object setAuthor:text];
	}
	else if ([elementName compare:@"identifier" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setGuid:)])
			[object setGuid:text];
	}
	else if ([elementName compare:@"subject" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCategory:)])
			[object setCategory:text];
	}
	else if ([elementName compare:@"rights" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCopyright:)])
			[object setCopyright:text];
	}
	else if ([elementName compare:@"date" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUpdated:)]) {
			[text replaceOccurrencesOfString:@":" withString:@"" options:0 range:NSMakeRange(0, text.length)];
			NSDate *date = nil;
			for (NSDateFormatter *dateFormatter in dateFormatters) {
				date = [dateFormatter dateFromString:text];
				if (date)
					break;
			}
			[object setUpdated:date];
		}
	}
	else if ([elementName compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
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
