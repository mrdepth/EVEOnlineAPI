//
//  EVECorpWalletJournal.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEWalletJournalItem : EVEObject
@property (nonatomic, strong) NSDate *date;
@property (nonatomic) int64_t refID;
@property (nonatomic) int32_t refTypeID;
@property (nonatomic, strong) NSString *ownerName1;
@property (nonatomic) int32_t ownerID1;
@property (nonatomic, strong) NSString *ownerName2;
@property (nonatomic) int32_t ownerID2;
@property (nonatomic, strong) NSString *argName1;
@property (nonatomic) int32_t argID1;
@property (nonatomic) float amount;
@property (nonatomic) float balance;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic) int32_t owner1TypeID;
@property (nonatomic) int32_t owner2TypeID;
@end

@interface EVECorpWalletJournal : EVEResult
@property (nonatomic, strong) NSArray *entries;
@end
