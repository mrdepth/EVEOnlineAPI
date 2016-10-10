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

@interface RSS()<NSXMLParserDelegate>

@end

@implementation RSS

+ (void) rssWithContentsOfURL:(NSURL*) url cachePolicy:(NSURLRequestCachePolicy) cachePolicy completionBlock:(void(^)(RSS* result, NSError* error)) completionBlock {
	static EVEHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[EVEHTTPSessionManager alloc] initWithBaseURL:nil];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
			manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//			manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"*/*"];
		});
	}
	manager.requestSerializer.cachePolicy = cachePolicy;
	[manager GET:[url absoluteString] parameters:nil completionBlock:^(id responseObject, NSError *error) {
		if (completionBlock) {
			if (!error) {
				RSSParser *parser = [[RSSParser alloc] init];
				NSError *parserError = nil;
				if ([parser parseXMLData:responseObject]) {
					RSS* rss = [RSS new];
					rss.feed = parser.feed;
					completionBlock(rss, nil);
				}
				else {
					completionBlock(nil, parser.error);
					parserError = [parser error];
				}
			}
			else
				completionBlock(nil, error);
		}
	}];
}

@end
