//
//  NSString+HTML.m
//  EscapeSequences
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+HTML.h"
#import "NSMutableString+HTML.h"

@implementation NSString(HTML)

- (NSString*) stringByReplacingHTMLEscapes {
	NSMutableString *string = [NSMutableString stringWithString:self];
	[string replaceHTMLEscapes];
	return string;
}

- (NSString*) stringByRemovingHTMLTags {
	NSMutableString *string = [NSMutableString stringWithString:self];
	[string removeHTMLTags];
	return string;
}

- (NSString*) stringByUnescapingHTML {
	NSMutableString* s = [self mutableCopy];
	NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"&(.*?);" options:0 error:nil];
	NSTextCheckingResult* result;
	while ((result = [expression firstMatchInString:s options:0 range:NSMakeRange(0, s.length)]) != nil) {
		NSString* escape = [s substringWithRange:result.range];
		[s replaceCharactersInRange:result.range withString:[[NSAttributedString alloc] initWithData:[escape dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) }
																				  documentAttributes:nil
																							   error:nil].string];
	}
	
	
	expression = [NSRegularExpression regularExpressionWithPattern:@"\\\\u(.{4})"
														   options:NSRegularExpressionCaseInsensitive
															 error:nil];
	while ((result = [expression firstMatchInString:s options:0 range:NSMakeRange(0, s.length)]) != nil) {
		NSScanner* scanner = [NSScanner scannerWithString:[s substringWithRange:result.range]];
		unsigned int i = ' ';
		unichar *u = (unichar*) &i;
		[scanner scanHexInt:&i];

		[s replaceCharactersInRange:result.range withString:[NSString stringWithCharacters:u length:1]];
	}
	
	[s replaceOccurrencesOfString:@"\\r" withString:@"" options:0 range:NSMakeRange(0, s.length)];
	[s replaceOccurrencesOfString:@"\\n" withString:@"\n" options:0 range:NSMakeRange(0, s.length)];
	return s;
}

@end
