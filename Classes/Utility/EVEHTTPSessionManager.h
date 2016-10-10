//
//  EVEHTTPSessionManager.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 07.10.16.
//
//

#import <AFNetworking/AFNetworking.h>

@protocol EVEHTTPCachedContent<NSObject>
@property (nonatomic, readonly) NSDate* currentTime;
@property (nonatomic, readonly) NSDate* cachedUntil;

@optional
@property (nonatomic, copy) NSDate* cacheDate;

@end

@interface EVEHTTPSessionManager : AFHTTPSessionManager

- (void) GET:(NSString *)URLString parameters:(id)parameters completionBlock:(void (^)(id responseObject, NSError* error))completionBlock;
- (void) POST:(NSString *)URLString parameters:(id)parameters completionBlock:(void (^)(id responseObject, NSError* error))completionBlock;
- (void) DELETE:(NSString *)URLString parameters:(id)parameters completionBlock:(void (^)(id responseObject, NSError* error))completionBlock;

- (void) dataTaskWithHTTPMethod:(NSString *)method URLString:(NSString *)URLString parameters:(id)parameters completionBlock:(void (^)(id responseObject, NSError* error))completionBlock;

@end
