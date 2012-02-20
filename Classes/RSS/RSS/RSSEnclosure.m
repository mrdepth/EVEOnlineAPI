//
//  RSSEnclosure.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSEnclosure.h"


@implementation RSSEnclosure
@synthesize url;
@synthesize length;
@synthesize type;

- (void) dealloc {
	[url release];
	[type release];
	[super dealloc];
}

@end
