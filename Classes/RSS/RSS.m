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

+ (NSURLSessionDataTask*) rssWithContentsOfURL:(NSURL*) url cachePolicy:(NSURLRequestCachePolicy) cachePolicy completionBlock:(void(^)(RSS* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	static AFHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
			manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//			manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"*/*"];
		});
	}
	manager.requestSerializer.cachePolicy = cachePolicy;
#warning TODO
	return nil;
	/*return [manager GET:[url absoluteString] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
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
	} failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
		completionBlock(nil, error);
	}];*/
}

@end
