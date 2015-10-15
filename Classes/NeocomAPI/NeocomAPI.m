//
//  NeocomAPI.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 15.10.15.
//
//

#import "NeocomAPI.h"
#import "NSDateFormatter+EVEOnlineAPI.h"
#import "NSURL+MD5.h"
#import "NAPISerializer.h"

@interface NeocomAPI()
- (AFHTTPRequestOperation*) request:(NSString*) URLString method:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
@end

@implementation NeocomAPI

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

- (AFHTTPRequestOperation*) lookupWithCriteria:(NSDictionary*) criteria completionBlock:(void(^)(NAPILookup* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	return [self request:@"lookup" method:@"GET" parameters:criteria responseClass:[NAPILookup class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) searchWithCriteria:(NSDictionary*) criteria order:(NSString*) order  completionBlock:(void(^)(NAPISearch* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [criteria mutableCopy] ?: [NSMutableDictionary new];
	if (order)
		parameters[@"order"] = order;
	
	return [self request:@"search" method:@"GET"  parameters:parameters responseClass:[NAPISearch class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperation*) uploadFitsWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID completionBlock:(void(^)(NAPIUpload* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (cannonicalNames)
		parameters[@"loadouts"] = cannonicalNames;
	if (userID)
		parameters[@"userID"] = userID;
	
	return [self request:@"upload" method:@"POST"  parameters:parameters responseClass:[NAPIUpload class] completionBlock:completionBlock progressBlock:progressBlock];
}

- (AFHTTPRequestOperationManager*) httpRequestOperationManager {
	static AFHTTPRequestOperationManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://neocom.by/"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}


#pragma mark - Private

- (AFHTTPRequestOperation*) request:(NSString*) URLString method:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock {
	NSString* urlString = [@"api" stringByAppendingPathComponent:URLString];
	
	AFHTTPRequestSerializer* serializer;
	if ([method isEqual:@"POST"])
		serializer = [AFJSONRequestSerializer serializer];
	else
		serializer = [AFHTTPRequestSerializer serializer];
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
	
	NSURLRequest* request = [serializer requestWithMethod:method
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
		
		operation.responseSerializer = [NAPISerializer serializerWithRootClass:responseClass];
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