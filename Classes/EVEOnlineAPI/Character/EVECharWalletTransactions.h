//
//  EVECharWalletTransactions.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharWalletTransactionsItem : NSObject<NSCoding>
@property (nonatomic, strong) NSDate *transactionDateTime;
@property (nonatomic) int64_t transactionID;
@property (nonatomic) int32_t quantity;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic) int32_t typeID;
@property (nonatomic) float price;
@property (nonatomic) int32_t clientID;
@property (nonatomic, copy) NSString *clientName;
@property (nonatomic) int32_t stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *transactionType;
@property (nonatomic, copy) NSString *transactionFor;

+ (id) charWalletTransactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharWalletTransactions : EVERequest
@property (nonatomic, strong) NSArray *transactions;

+ (id) charWalletTransactionsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID beforeTransID: (int64_t) beforeTransID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID beforeTransID: (int64_t) beforeTransID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end