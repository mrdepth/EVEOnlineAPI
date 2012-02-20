//
//  NSMutableString+RSSParser10.m
//  RSS
//
//  Created by Mr. Depth on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSMutableString+RSSParser10.h"


@implementation NSMutableString(RSSParser10)

- (void) removeSpaces {
	[self replaceOccurrencesOfString:@"\n" withString:@" " options:0 range:NSMakeRange(0, self.length)];
	[self replaceOccurrencesOfString:@"\r" withString:@" " options:0 range:NSMakeRange(0, self.length)];
	[self replaceOccurrencesOfString:@"\t" withString:@" " options:0 range:NSMakeRange(0, self.length)];
	int left = 5;
	while ([self replaceOccurrencesOfString:@"  " withString:@" " options:0 range:NSMakeRange(0, self.length)] && left)
		left--;
	if (self.length > 0 && [self characterAtIndex:0] == ' ')
		[self replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
}

@end
