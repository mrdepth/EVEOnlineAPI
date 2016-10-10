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
- (void) request:(NSString*) URLString method:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock;
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

- (void) lookupWithCriteria:(NSDictionary*) criteria completionBlock:(void(^)(NAPILookup* result, NSError* error)) completionBlock {
	[self request:@"lookup" method:@"GET" parameters:criteria responseClass:[NAPILookup class] completionBlock:completionBlock];
}

- (void) searchWithCriteria:(NSDictionary*) criteria order:(NSString*) order  completionBlock:(void(^)(NAPISearch* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [criteria mutableCopy] ?: [NSMutableDictionary new];
	if (order)
		parameters[@"order"] = order;
	
	[self request:@"search" method:@"GET"  parameters:parameters responseClass:[NAPISearch class] completionBlock:completionBlock];
}

- (void) uploadFitsWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID completionBlock:(void(^)(NAPIUpload* result, NSError* error)) completionBlock {
	NSMutableDictionary* parameters = [NSMutableDictionary new];
	if (cannonicalNames)
		parameters[@"loadouts"] = cannonicalNames;
	if (userID)
		parameters[@"userID"] = userID;
	
	 [self request:@"upload" method:@"POST"  parameters:parameters responseClass:[NAPIUpload class] completionBlock:completionBlock];
}

- (EVEHTTPSessionManager*) sessionManager {
	static EVEHTTPSessionManager* manager;
	if (!manager) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			manager = [[EVEHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://neocom.by/"]];
			manager.requestSerializer = [AFHTTPRequestSerializer serializer];
		});
	}
	return manager;
}


#pragma mark - Private

- (void) request:(NSString*) URLString method:(NSString*) method parameters:(NSDictionary*) parameters responseClass:(Class) responseClass completionBlock:(void(^)(id result, NSError* error)) completionBlock {
	URLString = [@"api" stringByAppendingPathComponent:URLString];
	
	AFHTTPRequestSerializer* serializer;
	if ([method isEqual:@"POST"])
		serializer = [AFJSONRequestSerializer serializer];
	else
		serializer = [AFHTTPRequestSerializer serializer];
	serializer.cachePolicy = self.cachePolicy;
	self.sessionManager.requestSerializer = serializer;
	self.sessionManager.responseSerializer = [NAPISerializer serializerWithRootClass:responseClass];
	
	[self.sessionManager dataTaskWithHTTPMethod:method URLString:URLString parameters:parameters completionBlock:completionBlock];
}

@end
