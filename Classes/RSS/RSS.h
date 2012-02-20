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


@interface RSS : EVECachedURLRequest<NSXMLParserDelegate> {
	RSSFeed *feed;
}
@property (nonatomic, retain) RSSFeed *feed;

+ (id) rssWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr;
+ (id) rssWithContentsOfURL: (NSURL*) url target:(id)target action:(SEL)action object:(id)object;
- (id) initWithContentsOfURL: (NSURL*) url error:(NSError **)errorPtr;
- (id) initWithContentsOfURL: (NSURL*) url target:(id)target action:(SEL)action object:(id)object;

@end
