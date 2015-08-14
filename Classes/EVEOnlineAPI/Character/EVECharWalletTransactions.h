//
//  EVECharWalletTransactions.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEWalletTransactionsItem : EVEObject
@property (nonatomic, strong) NSDate *transactionDateTime;
@property (nonatomic) int64_t transactionID;
@property (nonatomic) int32_t quantity;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic) int32_t typeID;
@property (nonatomic) float price;
@property (nonatomic) int32_t clientID;
@property (nonatomic, strong) NSString *clientName;
@property (nonatomic) int32_t stationID;
@property (nonatomic, strong) NSString *stationName;
@property (nonatomic, strong) NSString *transactionType;
@property (nonatomic, strong) NSString *transactionFor;
@property (nonatomic) int64_t journalTransactionID;
@property (nonatomic) int32_t clientTypeID;
@end

@interface EVECharWalletTransactions : EVEResult
@property (nonatomic, strong) NSArray *transactions;
@end