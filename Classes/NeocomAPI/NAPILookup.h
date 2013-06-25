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

+ (id) lookupWithCriteria:(NSDictionary*) criteria error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithCriteria:(NSDictionary*) criteria error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
