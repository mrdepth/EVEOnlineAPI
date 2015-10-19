//
//  EVEzKillBoardAPI.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 19.10.15.
//
//

#import "EVEzKillBoardAPI.h"
#import "EVEzKillBoardAPISerializer.h"
#import "NSDateFormatter+EVEOnlineAPI.h"
#import "NSURL+MD5.h"

@interface EVEzKillBoardAPI()
- (AFHTTPRequestOperation*) GET:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
@end

@implementation EVEzKillBoardAPI

- (instancetype) init {
	if (self = [self initWithCachePolicy:NSURLRequestUseProtocolCachePolicy]) {
	}
	return self;
}

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy {
	if (self = [super init]) {
		self.cachePolicy = cachePolicy;
	}
	return self;
}


- (AFHTTPRequestOperation*) searchWithFilter:(NSDictionary*) filter completionBlock:(void(^)(EVEzKillBoardSearch* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableString* args = [NSMutableString new];
	[filter enumerateKeysAndObjectsUsingBlock:^(NSString* key, id obj, BOOL *stop) {
		NSString* value = [obj description];
		if (value.length > 0)
			[args appendFormat:@"%@/%@/", key, value];
		else
			[args appendFormat:@"%@/", key];
	}];
	return [self GET:args parameters:nil responseClass:[EVEzKillBoardSearch class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperationManager*) httpRequestOperationManager {
	static AFHTTPRequestOperationManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://zkillboard.com"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}


#pragma mark - Private

- (AFHTTPRequestOperation*) GET:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSString* urlString = [@"api" stringByAppendingPathComponent:method];
	
	AFHTTPRequestSerializer* serializer = [AFHTTPRequestSerializer serializer];
	serializer.cachePolicy = self.cachePolicy;
	
	static NSMutableDictionary* dispatchGroups = nil;
	static NSMutableDictionary* operations = nil;
	if (!dispatchGroups) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			dispatchGroups = [NSMutableDictionary new];
		});
	}
	if (!operations) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			operations = [NSMutableDictionary new];
		});
	}
	
	NSURLRequest* request = [serializer requestWithMethod:@"GET"
												URLString:[[NSURL URLWithString:urlString relativeToURL:self.httpRequestOperationManager.baseURL] absoluteString]
											   parameters:parameters
													error:nil];
	
	BOOL load = NO;
	dispatch_group_t dispatchGroup;
	@synchronized(dispatchGroups) {
		dispatchGroup = dispatchGroups[request];
		if (!dispatchGroup) {
			dispatchGroups[request] = dispatchGroup = dispatch_group_create();
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
		AFHTTPRequestOperation *operation =
		[self.httpRequestOperationManager HTTPRequestOperationWithRequest:[request copy]
																  success:^void(AFHTTPRequestOperation * operation, id result) {
																	  if (result)
																		  dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"result":result});
																	  
																	  NSMutableDictionary* headers = [[operation.response allHeaderFields] mutableCopy];
																	  
																	  NSString* md5 = [operation.request.URL md5];
																	  NSString* etag = headers[@"Etag"];
																	  if (!etag || ![md5 isEqualToString:etag]) {
																		  
																		  NSString* date = [[NSDateFormatter rfc822DateFormatter] stringFromDate:[NSDate date]];
																		  NSString* expired = [[NSDateFormatter rfc822DateFormatter] stringFromDate:[NSDate dateWithTimeIntervalSinceNow:60 * 60]];
																		  
																		  if (date && expired) {
																			  headers[@"Date"] = date;
																			  headers[@"Expires"] = expired;
																			  headers[@"Etag"] = md5;
																			  [headers removeObjectForKey:@"Vary"];
																			  NSHTTPURLResponse* response = [[NSHTTPURLResponse alloc] initWithURL:operation.response.URL statusCode:operation.response.statusCode HTTPVersion:@"HTTP/1.1" headerFields:headers];
																			  NSCachedURLResponse* cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:operation.responseData userInfo:nil storagePolicy:NSURLCacheStorageAllowed];
																			  [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:operation.request];
																		  }
																	  }
																	  
																	  dispatch_group_leave(dispatchGroup);
																	  @synchronized(dispatchGroups) {
																		  [dispatchGroups removeObjectForKey:request];
																	  }
																	  @synchronized(operations) {
																		  [operations removeObjectForKey:request];
																	  }
																  }
																  failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
																	  if (error)
																		  dispatch_set_context(dispatchGroup, (__bridge_retained void*)@{@"error":error});
																	  dispatch_group_leave(dispatchGroup);
																	  @synchronized(dispatchGroups) {
																		  [dispatchGroups removeObjectForKey:request];
																	  }
																  }];
		@synchronized(operations) {
			operations[request] = operation;
		}
		
		operation.responseSerializer = [EVEzKillBoardAPISerializer serializerWithRootClass:responseClass];
		[operation setCacheResponseBlock:^NSCachedURLResponse* (NSURLConnection* connection, NSCachedURLResponse* response) {
			return nil;
		}];
		[self.httpRequestOperationManager.operationQueue addOperation:operation];
		return operation;
	}
	else {
		@synchronized(operations) {
			return operations[request];
		}
	}
}

@end
