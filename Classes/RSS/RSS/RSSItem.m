//
//  RSSItem.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"


@implementation RSSItem
@synthesize title;
@synthesize link;
@synthesize description;
@synthesize author;
@synthesize category;
@synthesize guid;
@synthesize updated;
@synthesize source;
@synthesize enclosure;

- (void) dealloc {
	[title release];
	[link release];
	[description release];
	[author release];
	[category release];
	[guid release];
	[updated release];
	[source release];
	[enclosure release];
	[super dealloc];
}

@end
