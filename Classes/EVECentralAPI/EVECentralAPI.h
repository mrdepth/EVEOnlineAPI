/*
 *  EVECentralAPI.h
 *  EVEOnlineAPI
 *
 *  Created by Artem Shimanski on 1/9/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#import <AFNetworking/AFNetworking.h>
#import <EVEAPI/EVECentralGlobals.h>
#import <EVEAPI/EVECentralMarketStat.h>
#import <EVEAPI/EVECentralQuickLook.h>

@interface EVECentralAPI : NSObject
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, readonly) AFHTTPSessionManager* httpRequestOperationManager;

- (instancetype) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy NS_DESIGNATED_INITIALIZER;

- (NSURLSessionDataTask*) marketStatWithTypeID: (int32_t) typeID regionIDs: (NSArray*) regionIDs hours: (int32_t) hours minQ: (int32_t) minQ completionBlock:(void(^)(EVECentralMarketStat* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;
- (NSURLSessionDataTask*) quickLookWithTypeID: (int32_t) typeID regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) hours minQ: (int32_t) minQ completionBlock:(void(^)(EVECentralQuickLook* result, NSError* error)) completionBlock progressBlock:(void(^)(float progress)) progressBlock;


@end
