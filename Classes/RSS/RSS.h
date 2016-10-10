//
//  RSS.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEHTTPSessionManager.h"
#import <EVEAPI/RSSFeed.h>

#define RSS_CACHE_TIME (60*60)


@interface RSS : NSObject
@property (nonatomic, strong) RSSFeed *feed;

+ (void) rssWithContentsOfURL:(NSURL*) url cachePolicy:(NSURLRequestCachePolicy) cachePolicy completionBlock:(void(^)(RSS* result, NSError* error)) completionBlock;

@end
