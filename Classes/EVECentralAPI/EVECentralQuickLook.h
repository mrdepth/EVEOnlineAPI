//
//  EVECentralQuickLook.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECentralRequest.h"

@interface EVECentralQuickLookOrder: NSObject<NSCoding>
@property (nonatomic) int32_t orderID;
@property (nonatomic) int32_t regionID;
@property (nonatomic) int32_t stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) float security;
@property (nonatomic) int32_t range;
@property (nonatomic) float price;
@property (nonatomic) int32_t volRemain;
@property (nonatomic) int32_t minVolume;
@property (nonatomic, strong) NSDate *expires;
@property (nonatomic, strong) NSDate *reportedTime;

+ (id) quickLookOrderWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end

@interface EVECentralQuickLook : EVECentralRequest
@property (nonatomic) int32_t typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, strong) NSMutableArray *regions;
@property (nonatomic) int32_t hours;
@property (nonatomic) int32_t minQ;
@property (nonatomic, strong) NSMutableArray *sellOrders;
@property (nonatomic, strong) NSMutableArray *buyOrders;

+ (id) quickLookWithTypeID: (int32_t) typeID regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) hours minQ: (int32_t) minQ cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithTypeID: (int32_t) typeID regionIDs: (NSArray*) regionIDs systemID: (int32_t) systemID hours: (int32_t) hours minQ: (int32_t) minQ cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
