//
//  RSSFeed.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSFeed.h"


@implementation RSSFeed
@synthesize title;
@synthesize description;
@synthesize copyright;
@synthesize language;
@synthesize link;
@synthesize publisher;
@synthesize updated;
@synthesize image;
@synthesize items;

- (id) init {
	if (self = [super init]) {
		items = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) dealloc {
	[title release];
	[description release];
	[copyright release];
	[language release];
	[link release];
	[publisher release];
	[updated release];
	[image release];
	[items release];
	[super dealloc];
}

@end
