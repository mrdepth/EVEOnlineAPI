//
//  RSSImage.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSImage.h"


@implementation RSSImage
@synthesize title;
@synthesize link;
@synthesize url;

- (void) dealloc {
	[title release];
	[link release];
	[url release];
	[super dealloc];
}

@end
