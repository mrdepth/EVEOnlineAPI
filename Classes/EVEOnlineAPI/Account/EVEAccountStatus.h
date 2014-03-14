//
//  EVEAccountStatus.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAccountStatus : EVERequest
@property (nonatomic, strong) NSDate *paidUntil;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic) int32_t logonCount;
@property (nonatomic) int32_t logonMinutes;

+ (id) accountStatusWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;


@end
