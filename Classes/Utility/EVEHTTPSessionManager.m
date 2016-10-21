//
//  EVEHTTPSessionManager.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 07.10.16.
//
//

#import "EVEHTTPSessionManager.h"
#import "NSDictionary+Hash.h"
#import "NSURL+MD5.h"
#import "NSDateFormatter+EVEOnlineAPI.h"

@implementation EVEHTTPSessionManager

- (instancetype)initWithBaseURL:(NSURL *)url
		   sessionConfiguration:(NSURLSessionConfiguration *)configuration {
	if (self = [super initWithBaseURL:url sessionConfiguration:configuration]) {
		self.responseSerializer = [AFHTTPResponseSerializer serializer];
	}
	return self;
}

- (void) GET:(NSString *)URLString parameters:(id)parameters responseSerializer:(AFHTTPResponseSerializer*) responseSerializer completionBlock:(void (^)(id responseObject, NSError* error))completionBlock {
	[self dataTaskWithHTTPMethod:@"GET" URLString:URLString parameters:parameters responseSerializer:responseSerializer completionBlock:completionBlock];
}

- (void) POST:(NSString *)URLString parameters:(id)parameters responseSerializer:(AFHTTPResponseSerializer*) responseSerializer completionBlock:(void (^)(id responseObject, NSError* error))completionBlock {
	[self dataTaskWithHTTPMethod:@"POST" URLString:URLString parameters:parameters responseSerializer:responseSerializer completionBlock:completionBlock];
}

- (void) DELETE:(NSString *)URLString parameters:(id)parameters responseSerializer:(AFHTTPResponseSerializer*) responseSerializer completionBlock:(void (^)(id responseObject, NSError* error))completionBlock {
	[self dataTaskWithHTTPMethod:@"DELETE" URLString:URLString parameters:parameters responseSerializer:responseSerializer completionBlock:completionBlock];
}

- (void) dataTaskWithHTTPMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters responseSerializer:(AFHTTPResponseSerializer*) responseSerializer completionBlock:(void (^)(id responseObject, NSError* error))completionBlock {
	static NSMutableDictionary* dispatchGroups = nil;
	static NSMutableDictionary* progress = nil;
	if (!dispatchGroups) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			dispatchGroups = [NSMutableDictionary new];
		});
	}
	if (!progress) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			progress = [NSMutableDictionary new];
		});
	}
	
	
	id requestKey = @([@{@"method":method, @"url":URLString, @"parameters":parameters ?: @""} fullHash]);
	
	NSMutableArray* progressArray;
	@synchronized (progress) {
		progressArray = progress[requestKey];
		if (!progressArray)
			progress[requestKey] = progressArray = [NSMutableArray new];
		[progressArray addObject:[NSProgress progressWithTotalUnitCount:100]];
	}
	
	BOOL load = NO;
	dispatch_group_t dispatchGroup;
	@synchronized(dispatchGroups) {
		dispatchGroup = dispatchGroups[requestKey];
		if (!dispatchGroup) {
			dispatchGroups[requestKey] = dispatchGroup = dispatch_group_create();
			dispatch_set_finalizer_f(dispatchGroup, (dispatch_function_t) &CFRelease);
			dispatch_group_enter(dispatchGroup);
			load = YES;
		}
	}
	
	if (completionBlock) {
		dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
			NSDictionary* context = (__bridge NSDictionary*) dispatch_get_context(dispatchGroup);
			completionBlock(context[@"result"], context[@"error"]);
		});
	}
	
	if (load) {
		__block id deserializedObject = nil;
		void (^success)(NSURLSessionDataTask * task, id) = ^(NSURLSessionDataTask* task, id responseObject) {
			NSError* error = nil;
			if ([responseObject isKindOfClass:[NSData class]] && self.responseSerializer)
				responseObject = [responseSerializer responseObjectForResponse:task.response data:responseObject error:&error];
			deserializedObject = responseObject;
			
			if (error) {
				dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"error":error});
			}
			else {
				for (NSProgress* progress in progressArray)
				progress.completedUnitCount = 100;
				
				if (responseObject)
				dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"result":responseObject});
				
				NSHTTPURLResponse* urlResponse = (NSHTTPURLResponse*) task.response;
				
				NSDictionary* headers = [urlResponse allHeaderFields];
				NSString* md5 = [task.currentRequest.URL md5];
				NSString* etag = headers[@"Etag"];
				
				id<EVEHTTPCachedContent> cachedContent = [responseObject conformsToProtocol:@protocol(EVEHTTPCachedContent)] ? responseObject : nil;
				
				if (cachedContent) {
					BOOL hasCacheDate = [cachedContent respondsToSelector:@selector(cacheDate)];
					if (hasCacheDate) {
						if (etag && [md5 isEqualToString:etag])
						cachedContent.cacheDate = [[NSDateFormatter rfc822DateFormatter] dateFromString:headers[@"Cache-Date"]];
						else
						cachedContent.cacheDate = [NSDate date];
					}
				}
			}
			
			
			dispatch_group_leave(dispatchGroup);
			@synchronized(dispatchGroups) {
				[dispatchGroups removeObjectForKey:requestKey];
			}
			@synchronized(progress) {
				[progress removeObjectForKey:requestKey];
			};
		};
		
		void (^failure)(NSURLSessionDataTask* task, NSError* error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
			if (error)
				dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"error":error});
			dispatch_group_leave(dispatchGroup);
			@synchronized(dispatchGroups) {
				[dispatchGroups removeObjectForKey:requestKey];
			}
			@synchronized(progress) {
				[progress removeObjectForKey:requestKey];
			}
		};
		
		void (^progress)(NSProgress*) = ^(NSProgress* progress) {
			for (NSProgress* ite in progressArray)
				ite.completedUnitCount = progress.fractionCompleted * 100;
		};
		
		NSURLSessionDataTask* task;
		if ([method isEqualToString:@"POST"])
			task = [self POST:URLString parameters:parameters progress:progress success:success failure:failure];
		else if ([method isEqualToString:@"DELETE"])
			task = [self DELETE:URLString parameters:parameters success:success failure:failure];
		else
			task = [self GET:URLString parameters:parameters progress:progress success:success failure:failure];
		
		NSNotificationCenter * __weak center = [NSNotificationCenter defaultCenter];
		id __block observer = [center addObserverForName:AFNetworkingTaskDidCompleteNotification object:task queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
			NSError* error = note.userInfo[AFNetworkingTaskDidCompleteErrorKey];
			if (!error) {
				NSURLSessionDataTask* task = note.object;
				id responseObject = deserializedObject;
				NSData* responseData = note.userInfo[AFNetworkingTaskDidCompleteResponseDataKey];
				
				NSHTTPURLResponse* urlResponse = (NSHTTPURLResponse*) task.response;
				
				NSMutableDictionary* headers = [[urlResponse allHeaderFields] mutableCopy];
				NSString* md5 = [task.currentRequest.URL md5];
				NSString* etag = headers[@"Etag"];

				id<EVEHTTPCachedContent> cachedContent = [responseObject conformsToProtocol:@protocol(EVEHTTPCachedContent)] ? responseObject : nil;

				if (cachedContent && responseData) {
					BOOL hasCacheDate = [cachedContent respondsToSelector:@selector(cacheDate)];
					if (!etag || ![md5 isEqualToString:etag]) {
						NSString* date = [[NSDateFormatter rfc822DateFormatter] stringFromDate:cachedContent.currentTime];
						NSString* expired = [[NSDateFormatter rfc822DateFormatter] stringFromDate:cachedContent.cachedUntil];
						NSString* cacheDate = hasCacheDate ? [[NSDateFormatter rfc822DateFormatter] stringFromDate:cachedContent.cacheDate] : nil;
						if (date && expired) {
							headers[@"Date"] = date;
							headers[@"Expires"] = expired;
							headers[@"Etag"] = md5;
							if (cacheDate)
								headers[@"Cache-Date"] = cacheDate;
							[headers removeObjectForKey:@"Vary"];
							NSHTTPURLResponse* response = [[NSHTTPURLResponse alloc] initWithURL:urlResponse.URL statusCode:urlResponse.statusCode HTTPVersion:@"HTTP/1.1" headerFields:headers];
							NSCachedURLResponse* cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:responseData userInfo:nil storagePolicy:NSURLCacheStorageAllowed];
							[[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:task.currentRequest];
						}
					}
				}
			}
			
			[center removeObserver:observer];
		}];
	}
}


@end
