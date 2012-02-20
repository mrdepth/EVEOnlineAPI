//
//  EVECachedURLRequest.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	EVERequestCacheStyleShort,
	EVERequestCacheStyleModifiedShort,
	EVERequestCacheStyleLong
} EVERequestCacheStyle;

@interface EVECachedURLRequest : NSObject {
	BOOL isCached;
	id delegate;
	SEL selector;
	IMP method;
	id targetObject;
	NSURL *requestUrl;
	NSURLConnection *connection;
	NSData *data;
	NSInteger errorCode;
	NSError *error;
	NSDate *cacheDate;
	EVERequestCacheStyle cacheStyle;
	NSString *hash;
	BOOL isFinishedLoading;
	NSThread *scheduleThread;
}

@property (readonly) BOOL isCached;
@property (readonly) NSDate *cacheDate;

- (id) initWithURL: (NSURL*) url cacheStyle:(EVERequestCacheStyle) cacheStyle error:(NSError **)errorPtr;
- (id) initWithURL: (NSURL*) url cacheStyle:(EVERequestCacheStyle) cacheStyle target:(id)target action:(SEL)action object:(id)object;
- (id) initWithURL: (NSURL*) url bodyData:(NSData*) bodyData contentType:(NSString*) contentType cacheStyle:(EVERequestCacheStyle) cacheStyle target:(id)target action:(SEL)action object:(id)object;
- (id) initWithURL: (NSURL*) url bodyData:(NSData*) bodyData contentType:(NSString*) contentType cacheStyle:(EVERequestCacheStyle) cacheStyle error:(NSError **)errorPtr;
@end

@interface EVECachedURLRequest(Protected)
@property (nonatomic, retain) NSURL *requestUrl;

- (NSError*) parseData: (NSData*) data;
- (void) didCompleteWithError: (NSError*) error;
- (void) cacheData;
- (void) backgroundProcessResults;

@end
