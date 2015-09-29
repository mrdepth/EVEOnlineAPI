//
//  RSSParserAtom.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParserAtom.h"
#import "NSMutableString+RSSParser10.h"

@interface RSSParserAtom()
@property (nonatomic, strong) NSMutableString *text;
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) NSMutableArray *dateFormatters;

@end

@implementation RSSParserAtom

- (id) init {
	if (self = [super init]) {
		self.stack = [[NSMutableArray alloc] init];
		self.text = [[NSMutableString alloc] init];
		self.dateFormatters = [[NSMutableArray alloc] init];
		
		NSDateFormatter *dateFormatter;
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmZZZ"];
		[self.dateFormatters addObject:dateFormatter];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmssZZZ"];
		[self.dateFormatters addObject:dateFormatter];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmss.SZZZ"];
		[self.dateFormatters addObject:dateFormatter];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd"];
		[self.dateFormatters addObject:dateFormatter];
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	[self.text setString:@""];
	id object = [self.stack lastObject];
	if (!object)
		object = self.feed;
	
	if ([elementName compare:@"entry" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSItem *item = [[RSSItem alloc] init];
		[self.feed.items addObject:item];
		[self.stack addObject:item];
	}
	else if ([elementName compare:@"link" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		NSString *rel = [attributeDict valueForKey:@"rel"];
		if ([rel isEqualToString:@"enclosure"]) {
			RSSEnclosure *enclosure = [[RSSEnclosure alloc] init];
			if ([object respondsToSelector:@selector(setEnclosure:)])
				[object setEnclosure:enclosure];
			enclosure.url = [NSURL URLWithString:[attributeDict valueForKey:@"href"]];
			enclosure.length = [[attributeDict valueForKey:@"length"] intValue];
			enclosure.type = [attributeDict valueForKey:@"type"];
		}
		else if ([rel isEqualToString:@"alternate"]) {
			if ([object respondsToSelector:@selector(setLink:)])
				[object setLink:[NSURL URLWithString:[attributeDict valueForKey:@"href"]]];
		}
	}
	else if ([elementName compare:@"author" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setAuthor:)]) {
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[object methodSignatureForSelector:@selector(setAuthor:)]];
			[object setAuthor:[attributeDict valueForKey:@"href"]];
			[invocation setTarget:object];
			[invocation setSelector:@selector(setAuthor:)];
			[self.stack addObject:invocation];
		}
		else if ([object respondsToSelector:@selector(setPublisher:)]) {
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[object methodSignatureForSelector:@selector(setPublisher:)]];
			[object setPublisher:[attributeDict valueForKey:@"href"]];
			[invocation setTarget:object];
			[invocation setSelector:@selector(setPublisher:)];
			[self.stack addObject:invocation];
		}
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSSource *source = [[RSSSource alloc] init];
		if ([object respondsToSelector:@selector(setSource:)])
			[object setSource:source];
		source.url = [NSURL URLWithString:[attributeDict valueForKey:@"url"]];
		[self.stack addObject:source];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	id object = [self.stack lastObject];
	if (!object)
		object = self.feed;

	[self.text removeSpaces];
	if ([elementName compare:@"title" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setTitle:)])
			[object setTitle:self.text];
	}
	else if ([elementName compare:@"id" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setGuid:)])
			[object setGuid:self.text];
	}
	else if ([elementName compare:@"updated" options:NSCaseInsensitiveSearch] == NSOrderedSame ||
			 [elementName compare:@"published" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		
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
	else if ([elementName compare:@"name" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object isKindOfClass:[NSInvocation class]]) {
			[object setArgument:&_text atIndex:2];
			[object invoke];
		}
	}
	else if ([elementName compare:@"subtitle" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)])
			[object setDescription:self.text];
	}
	else if ([elementName compare:@"content" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)])
			[object setDescription:self.text];
	}
	else if ([elementName compare:@"summary" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)]) {
			if (![object description])
				[object setDescription:self.text];
		}
	}
	else if ([elementName compare:@"rights" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCopyright:)])
			[object setCopyright:self.text];
	}
	else if ([elementName compare:@"icon" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if (!self.feed.image) {
			RSSImage *image = [[RSSImage alloc] init];
			image.url = [NSURL URLWithString:self.text];
			self.feed.image = image;
		}
	}
	else if ([elementName compare:@"logo" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSImage *image = [[RSSImage alloc] init];
		image.url = [NSURL URLWithString:self.text];
		self.feed.image = image;
	}
	else if ([elementName compare:@"entry" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[self.stack removeLastObject];
	}
	else if ([elementName compare:@"author" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object isKindOfClass:[NSInvocation class]])
			[self.stack removeLastObject];
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
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
