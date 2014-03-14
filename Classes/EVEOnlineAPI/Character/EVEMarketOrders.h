//
//  EVEMarketOrders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMarketOrdersItem : NSObject<NSCoding>
@property (nonatomic) int32_t orderID;
@property (nonatomic) int32_t charID;
@property (nonatomic) int32_t stationID;
@property (nonatomic) int32_t volEntered;
@property (nonatomic) int32_t volRemaining;
@property (nonatomic) int32_t minVolume;
@property (nonatomic) EVEOrderState orderState;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t range;
@property (nonatomic) int32_t accountKey;
@property (nonatomic) int32_t duration;
@property (nonatomic) float escrow;
@property (nonatomic) float price;
@property (nonatomic) BOOL bid;
@property (nonatomic, strong) NSDate *issued;

+ (id) marketOrdersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMarketOrders : EVERequest
@property (nonatomic, strong) NSArray *orders;

+ (id) marketOrdersWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

