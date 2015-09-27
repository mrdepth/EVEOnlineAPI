//
//  EVECharWalletJournal.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpWalletJournal.h"

@interface EVECharWalletJournalItem : EVEWalletJournalItem
@property (nonatomic) int32_t taxReceiverID;
@property (nonatomic) float taxAmount;
@end

@interface EVECharWalletJournal : EVEResult
@property (nonatomic, strong) NSArray *transactions;
@end
