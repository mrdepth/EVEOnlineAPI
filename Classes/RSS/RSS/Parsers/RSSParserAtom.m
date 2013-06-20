//
//  RSSParserAtom.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSParserAtom.h"
#import "NSMutableString+RSSParser10.h"

@implementation RSSParserAtom
@synthesize feed;

- (id) init {
	if (self = [super init]) {
		stack = [[NSMutableArray alloc] init];
		text = [[NSMutableString alloc] init];
		dateFormatters = [[NSMutableArray alloc] init];
		
		NSDateFormatter *dateFormatter;
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmZZZ"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmssZZZ"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HHmmss.SZZZ"];
		[dateFormatters addObject:dateFormatter];
		[dateFormatter release];
		
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
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
	id object = [stack lastObject];
	if (!object)
		object = feed;
	
	if ([elementName compare:@"entry" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSItem *item = [[RSSItem alloc] init];
		[feed.items addObject:item];
		[stack addObject:item];
		[item release];
	}
	else if ([elementName compare:@"link" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		NSString *rel = [attributeDict valueForKey:@"rel"];
		if ([rel isEqualToString:@"enclosure"]) {
			RSSEnclosure *enclosure = [[RSSEnclosure alloc] init];
			if ([object respondsToSelector:@selector(setEnclosure:)])
				[object setEnclosure:enclosure];
			enclosure.url = [NSURL URLWithString:[attributeDict valueForKey:@"href"]];
			enclosure.length = [[attributeDict valueForKey:@"length"] integerValue];
			enclosure.type = [attributeDict valueForKey:@"type"];
			[enclosure release];
		}
		else if ([rel isEqualToString:@"alternate"]) {
			if ([object respondsToSelector:@selector(setLink:)])
				[object setLink:[NSURL URLWithString:[attributeDict valueForKey:@"href"]]];
		}
	}
	else if ([elementName compare:@"author" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setAuthor:)]) {
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[object methodSignatureForSelector:@selector(setAuthor:)]];
			[object setAuthor:[NSURL URLWithString:[attributeDict valueForKey:@"href"]]];
			[invocation setTarget:object];
			[invocation setSelector:@selector(setAuthor:)];
			[stack addObject:invocation];
		}
		else if ([object respondsToSelector:@selector(setPublisher:)]) {
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[object methodSignatureForSelector:@selector(setPublisher:)]];
			[object setPublisher:[NSURL URLWithString:[attributeDict valueForKey:@"href"]]];
			[invocation setTarget:object];
			[invocation setSelector:@selector(setPublisher:)];
			[stack addObject:invocation];
		}
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSSource *source = [[RSSSource alloc] init];
		if ([object respondsToSelector:@selector(setSource:)])
			[object setSource:source];
		source.url = [NSURL URLWithString:[attributeDict valueForKey:@"url"]];
		[stack addObject:source];
		[source release];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	id object = [stack lastObject];
	if (!object)
		object = feed;

	[text removeSpaces];
	if ([elementName compare:@"title" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setTitle:)])
			[object setTitle:text];
	}
	else if ([elementName compare:@"id" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setGuid:)])
			[object setGuid:text];
	}
	else if ([elementName compare:@"updated" options:NSCaseInsensitiveSearch] == NSOrderedSame ||
			 [elementName compare:@"published" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		
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
	else if ([elementName compare:@"name" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object isKindOfClass:[NSInvocation class]]) {
			[object setArgument:&text atIndex:2];
			[object invoke];
		}
	}
	else if ([elementName compare:@"subtitle" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)])
			[object setDescription:text];
	}
	else if ([elementName compare:@"content" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)])
			[object setDescription:text];
	}
	else if ([elementName compare:@"summary" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setDescription:)]) {
			if (![object description])
				[object setDescription:text];
		}
	}
	else if ([elementName compare:@"rights" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object respondsToSelector:@selector(setCopyright:)])
			[object setCopyright:text];
	}
	else if ([elementName compare:@"icon" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if (!feed.image) {
			RSSImage *image = [[RSSImage alloc] init];
			image.url = [NSURL URLWithString:text];
			feed.image = image;
			[image release];
		}
	}
	else if ([elementName compare:@"logo" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		RSSImage *image = [[RSSImage alloc] init];
		image.url = [NSURL URLWithString:text];
		feed.image = image;
		[image release];
	}
	else if ([elementName compare:@"entry" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		[stack removeLastObject];
	}
	else if ([elementName compare:@"author" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		if ([object isKindOfClass:[NSInvocation class]])
			[stack removeLastObject];
	}
	else if ([elementName compare:@"source" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
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


/*
<entry><id>tag:blogger.com,1999:blog-7252484281098761628.post-5859867541985419932</id>
<published>2011-09-08T05:43:00.000-07:00</published>
<updated>2011-09-08T05:44:48.174-07:00</updated>
<title type='text'>Contracts Section</title>
<content type='html'>&lt;div dir="ltr" style="text-align: left;" trbidi="on"&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;a href="http://2.bp.blogspot.com/-hHjbl1wtjT0/Tmi3K_d_VRI/AAAAAAAAADA/m3SFhT50UqE/s1600/Untitled.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" height="240" src="http://2.bp.blogspot.com/-hHjbl1wtjT0/Tmi3K_d_VRI/AAAAAAAAADA/m3SFhT50UqE/s320/Untitled.png" width="320" /&gt;&lt;/a&gt;&lt;a href="http://4.bp.blogspot.com/-k76qxJlr0MA/Tmi3PlVVk1I/AAAAAAAAADE/2OMuZBJXRWE/s1600/Untitled+2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"&gt;&lt;img border="0" height="240" src="http://4.bp.blogspot.com/-k76qxJlr0MA/Tmi3PlVVk1I/AAAAAAAAADE/2OMuZBJXRWE/s320/Untitled+2.png" width="320" /&gt;&lt;/a&gt;&lt;/div&gt;&lt;br /&gt;&lt;div class="separator" style="clear: both; text-align: center;"&gt;&lt;img border="0" height="320" src="http://3.bp.blogspot.com/-FkLK9EgrMOk/Tmi3QgJ9jrI/AAAAAAAAADI/sPk83aLDgWY/s320/Untitled+3.png" width="213" /&gt;&amp;nbsp; &lt;img border="0" height="320" src="http://4.bp.blogspot.com/-mwyzeqR5KVs/Tmi3RlAeMZI/AAAAAAAAADM/DmEghNexRsI/s320/Untitled+4.png" width="213" /&gt;&lt;/div&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/div&gt;&lt;div class="blogger-post-footer"&gt;&lt;img width='1' height='1' src='https://blogger.googleusercontent.com/tracker/7252484281098761628-5859867541985419932?l=www.eveuniverseiphone.com' alt='' /&gt;&lt;/div&gt;
</content>
<link rel='replies' type='application/atom+xml' href='http://www.eveuniverseiphone.com/feeds/5859867541985419932/comments/default' title='Post Comments'/>
<link rel='replies' type='text/html' href='http://www.eveuniverseiphone.com/2011/09/contracts-section.html#comment-form' title='5 Comments'/>
<link rel='edit' type='application/atom+xml' href='http://www.blogger.com/feeds/7252484281098761628/posts/default/5859867541985419932'/>
<link rel='self' type='application/atom+xml' href='http://www.blogger.com/feeds/7252484281098761628/posts/default/5859867541985419932'/>
<link rel='alternate' type='text/html' href='http://www.eveuniverseiphone.com/2011/09/contracts-section.html' title='Contracts Section'/>
<author><name>Artem Shimanski</name><uri>http://www.blogger.com/profile/05241437057183694626</uri><email>noreply@blogger.com</email></author>
<media:thumbnail xmlns:media='http://search.yahoo.com/mrss/' url='http://2.bp.blogspot.com/-hHjbl1wtjT0/Tmi3K_d_VRI/AAAAAAAAADA/m3SFhT50UqE/s72-c/Untitled.png' height='72' width='72'/>
<thr:total>5</thr:total></entry>
*/