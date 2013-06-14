//
//  RSS.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECachedURLRequest.h"
#import "RSSFeed.h"

#define RSS_CACHE_TIME (60*60)


@interface RSS : EVECachedURLRequest<NSXMLParserDelegate>
@property (nonatomic, strong) RSSFeed *feed;

+ (id) rssWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
