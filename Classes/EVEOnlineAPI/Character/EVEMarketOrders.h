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
@property (nonatomic) NSInteger orderID;
@property (nonatomic) NSInteger charID;
@property (nonatomic) NSInteger stationID;
@property (nonatomic) NSInteger volEntered;
@property (nonatomic) NSInteger volRemaining;
@property (nonatomic) NSInteger minVolume;
@property (nonatomic) EVEOrderState orderState;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger range;
@property (nonatomic) NSInteger accountKey;
@property (nonatomic) NSInteger duration;
@property (nonatomic) float escrow;
@property (nonatomic) float price;
@property (nonatomic) BOOL bid;
@property (nonatomic, strong) NSDate *issued;

+ (id) marketOrdersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMarketOrders : EVERequest
@property (nonatomic, strong) NSArray *orders;

+ (id) marketOrdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

