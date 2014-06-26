//
//  RSS.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSS.h"
#import "NSString+HTML.h"
#import "RSSParser.h"

@implementation RSS

+ (id) rssWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[RSS alloc] initWithContentsOfURL:url error:errorPtr progressHandler:progressHandler];
}

- (id) initWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy error:errorPtr progressHandler:progressHandler]) {
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
		parserError = [parser error];
	}
	self.cacheExpireDate = [NSDate dateWithTimeIntervalSinceNow:RSS_CACHE_TIME];
	return parserError;
}

@end
