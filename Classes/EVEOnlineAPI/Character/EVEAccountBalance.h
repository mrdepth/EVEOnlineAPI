//
//  EVEAccountBalance.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEAccountBalanceItem : EVEObject
@property (nonatomic) int32_t accountID;
@property (nonatomic) int32_t accountKey;
@property (nonatomic) double balance;
@end


@interface EVEAccountBalance : EVEResult
@property (nonatomic, strong) NSArray *accounts;
@end
