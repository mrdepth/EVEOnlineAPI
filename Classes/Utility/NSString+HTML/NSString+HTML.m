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

@end
