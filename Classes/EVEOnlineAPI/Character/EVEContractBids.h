//
//  EVEContractBids.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContractBidsItem : NSObject<NSCoding>
@property (nonatomic) int32_t bidID;
@property (nonatomic) int32_t contractID;
@property (nonatomic) int32_t bidderID;
@property (nonatomic, strong) NSDate *dateBid;
@property (nonatomic) float amount;

+ (id) contractBidsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContractBids : EVERequest
@property (nonatomic, strong) NSArray *bidList;

+ (id) contractBidsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
