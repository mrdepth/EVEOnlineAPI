//
//  RSS.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSS.h"
#import "EVERequestsCache.h"
#import "NSString+HTML.h"
#import "RSSParser.h"

@implementation RSS
@synthesize feed;

+ (id) rssWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr {
	return [[[RSS alloc] initWithContentsOfURL:url error:errorPtr] autorelease];
}

+ (id) rssWithContentsOfURL: (NSURL*) url target:(id)target action:(SEL)action object:(id)object {
	return [[[RSS alloc] initWithContentsOfURL:url target:target action:action object:object] autorelease];
}

- (id) initWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr {
	if (self = [super initWithURL:url cacheStyle:(EVERequestCacheStyle)EVERequestCacheStyleModifiedShort error:errorPtr]) {
	}
	return self;
}

- (id) initWithContentsOfURL: (NSURL*) url target:(id)target action:(SEL)action object:(id)object {
	if (self = [super initWithURL:url cacheStyle:EVERequestCacheStyleModifiedShort target:target action:action object:object]) {
	}
	return self;
}


- (NSError*) parseData: (NSData*) aData {
	RSSParser *parser = [[RSSParser alloc] init];
	NSError *parserError = nil;
	if ([parser parseXMLData:aData]) {
		self.feed = parser.feed;
	}
	else {
		parserError = [[[parser error] retain] autorelease];
	}
	[parser release];
	return parserError;
}

- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:RSS_CACHE_TIME];
	[cache cacheData:data withURL:requestUrl cachedUntil:date];
}

- (void) dealloc {
	[feed release];
	[super dealloc];
}

@end
