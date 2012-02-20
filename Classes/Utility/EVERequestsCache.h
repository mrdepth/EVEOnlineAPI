//
//  EVERequestsCache.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVERequestsCache : NSObject {
	NSMutableDictionary *cache;
}

+ (EVERequestsCache*) sharedRequestsCache;
+ (NSString*) cacheDirectory;
+ (NSString*) cacheFileName;

- (NSData*) cachedDataWithURL:(NSURL*) url date:(NSDate*) date;
- (NSData*) cachedDataWithHash:(NSString*) hash date:(NSDate *)date;
- (NSDate*) cacheDateForDataWithURL: (NSURL*) url;
- (void) cacheData: (NSData*) data withURL: (NSURL*) url cachedUntil: (NSDate*) cachedUntil;
- (void) cacheData: (NSData*) data withHash: (NSString*) hash cachedUntil: (NSDate*) cachedUntil;
- (void) clear;
@end
