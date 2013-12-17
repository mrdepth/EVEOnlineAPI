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
@property (nonatomic) NSInteger transactionID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) float price;
@property (nonatomic) NSInteger clientID;
@property (nonatomic, copy) NSString *clientName;
@property (nonatomic) NSInteger stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *transactionType;
@property (nonatomic, copy) NSString *transactionFor;

+ (id) charWalletTransactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharWalletTransactions : EVERequest
@property (nonatomic, strong) NSArray *transactions;

+ (id) charWalletTransactionsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeTransID: (NSInteger) beforeTransID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end