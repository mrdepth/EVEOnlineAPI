//
//  EVECachedURLRequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECachedURLRequest.h"
#import "NSData+MD5.h"
#import "ASURLConnection.h"

#define DEFAULT_CACHE_TIME 60*60

static BOOL offlineMode = NO;

@interface EVECachedURLRequest()
@property (assign, nonatomic, readwrite, getter = isCashed) BOOL cached;
@end

@implementation EVECachedURLRequest

+ (void) setOfflineMode:(BOOL) aOfflineMode {
	offlineMode = aOfflineMode;
}

+ (BOOL) isOfflineMode {
	return offlineMode;
}

- (id) initWithURL: (NSURL*) url cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
	request.cachePolicy = cachePolicy;
	[request setTimeoutInterval:20];

	if (self = [self initWithRequest:request error:errorPtr progressHandler:progressHandler]) {
	}
	return self;
}

- (id) initWithURL: (NSURL*) url bodyData:(NSData*) bodyData contentType:(NSString*) contentType cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
	[request setHTTPMethod:@"POST"];
	[request setHTTPBody:bodyData];
	[request setValue:contentType forHTTPHeaderField:@"Content-Type"];
	request.cachePolicy = cachePolicy;
	[request setTimeoutInterval:20];
	if (self = [self initWithRequest:request error:errorPtr progressHandler:progressHandler]) {
		
	}
	return self;
}

- (id) initWithRequest:(NSURLRequest*) request error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super init]) {
		self.url = request.URL;
		
		NSURLCache* cache = [NSURLCache sharedURLCache];
		NSCachedURLResponse* cachedResponse = [cache cachedResponseForRequest:request];
		
		NSData* data = nil;
		if (cachedResponse && request.cachePolicy != NSURLRequestReloadIgnoringCacheData) {
			self.cacheExpireDate = [cachedResponse.userInfo valueForKey:@"cacheExpireDate"];
			self.cacheDate = [cachedResponse.userInfo valueForKey:@"cacheDate"];
			if (self.cacheExpireDate && [self.cacheExpireDate laterDate:[NSDate date]] == self.cacheExpireDate)
				data = cachedResponse.data;
		}
		
		NSError* error = nil;

		NSURLResponse* response = nil;
		if (offlineMode) {
			data = cachedResponse.data;
			if (!data)
				error = [NSError errorWithDomain:EVECachedURLRequestErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey : NSLocalizedString(@"This page is not available in offline mode", nil)}];
		}
		else {
			if (!data) {
				data = [ASURLConnection sendSynchronousRequest:request returningResponse:&response error:&error progressHandler:progressHandler];
				if (data) {
					self.cacheDate = [NSDate date];
					self.cacheExpireDate = [NSDate dateWithTimeIntervalSinceNow:DEFAULT_CACHE_TIME];
				}
				else if (cachedResponse && [[error domain] isEqualToString:@"NSURLErrorDomain"] && request.cachePolicy != NSURLRequestReloadIgnoringLocalCacheData) {
					self.cached = YES;
					data = [cachedResponse data];
				}
			}
			else
				self.cached = YES;
		}
		
		if (data) {
			error = [self parseData:data];
			if (!self.cached && response) {
				cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response
																		  data:data
																	  userInfo:@{@"cacheDate": self.cacheDate, @"cacheExpireDate": self.cacheExpireDate}
																 storagePolicy:NSURLCacheStorageAllowed];
				[cache storeCachedResponse:cachedResponse forRequest:request];
			}
		}
		if (errorPtr)
			*errorPtr = error;
		if (error)
			self = nil;
	}
	return self;
}

- (NSError*) parseData: (NSData*) data {
	return nil;
}


@end