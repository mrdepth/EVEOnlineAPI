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
- (void) GET:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock;
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


- (void) searchWithFilter:(NSDictionary*) filter completionBlock:(void(^)(EVEzKillBoardSearch* result, NSError* error)) completionBlock {
	NSMutableString* args = [NSMutableString new];
	[filter enumerateKeysAndObjectsUsingBlock:^(NSString* key, id obj, BOOL *stop) {
		NSString* value = [obj description];
		if (value.length > 0)
			[args appendFormat:@"%@/%@/", key, value];
		else
			[args appendFormat:@"%@/", key];
	}];
	[self GET:args parameters:nil responseClass:[EVEzKillBoardSearch class] completionBlock:completionBlock];
}

- (EVEHTTPSessionManager*) sessionManager {
	static EVEHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[EVEHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://zkillboard.com"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}


#pragma mark - Private

- (void) GET:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	NSString* urlString = [@"api" stringByAppendingPathComponent:method];
	
	self.sessionManager.requestSerializer.cachePolicy = self.cachePolicy;
	self.sessionManager.responseSerializer = [EVEzKillBoardAPISerializer serializerWithRootClass:responseClass];;
	[self.sessionManager GET:urlString parameters:parameters completionBlock:completionBlock];
}

@end
