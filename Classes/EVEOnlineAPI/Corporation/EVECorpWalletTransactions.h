//
//  EVECorpWalletTransactions.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharWalletTransactions.h"

@interface EVECorpWalletTransactionsItem : EVEWalletTransactionsItem
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@end

@interface EVECorpWalletTransactions : EVEResult
@property (nonatomic, strong) NSArray *transactions;
@end