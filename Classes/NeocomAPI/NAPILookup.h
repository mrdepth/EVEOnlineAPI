//
//  NAPILookup.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 19.06.13.
//
//

#import "EVECachedURLRequest.h"

@interface NAPILookup : EVECachedURLRequest
@property (nonatomic, assign) NSInteger count;

+ (id) lookupWithCriteria:(NSDictionary*) criteria cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCriteria:(NSDictionary*) criteria cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
