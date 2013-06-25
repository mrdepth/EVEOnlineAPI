//
//  RSSParser10.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParser10.h"
#import "NSMutableString+RSSParser10.h"

@interface RSSParser10()
@property (nonatomic, strong) NSMutableString *text;
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) NSMutableArray *dateFormatters;

@end

@implementation RSSParser10

- (id) init {
	if (self = [super init]) {
		self.stack = [[NSMutableArray alloc] init];
		self.text = [[NSMutableString alloc] init];
		self.dateFormatters = [[NSMutableArray alloc] init];

		NSDateFormatter *dateFormatter;
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmZZZ"];
		[self.dateFormatters addObject:dateFormatter];

		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmssZZZ"];
		[self.dateFormatters addObject:dateFormatter];

		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmss.SZZZ"];
		[self.dateFormatters addObject:dateFormatter];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd"];
		[self.dateFormatters addObject:dateFormatter];
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	[self.text setString:@""];
	
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
	else if ([elementName compare:@"url" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUrl:)])
			[object setUrl:[NSURL URLWithString:self.text]];
	}
	else if ([elementName compare:@"image" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[self.stack removeLastObject];
	}
	else if ([elementName compare:@"creator" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setAuthor:)])
			[object setAuthor:self.text];
	}
	else if ([elementName compare:@"identifier" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setGuid:)])
			[object setGuid:self.text];
	}
	else if ([elementName compare:@"subject" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCategory:)])
			[object setCategory:self.text];
	}
	else if ([elementName compare:@"rights" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCopyright:)])
			[object setCopyright:self.text];
	}
	else if ([elementName compare:@"date" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setUpdated:)]) {
			[self.text replaceOccurrencesOfString:@":" withString:@"" options:0 range:NSMakeRange(0, self.text.length)];
			NSDate *date = nil;
			for (NSDateFormatter *dateFormatter in self.dateFormatters) {
				date = [dateFormatter dateFromString:self.text];
				if (date)
					break;
			}
			[object setUpdated:date];
		}
	}
	else if ([elementName compare:@"item" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
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
