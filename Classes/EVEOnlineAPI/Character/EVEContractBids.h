//
//  EVEContractBids.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEContractBidsItem : EVEObject
@property (nonatomic) int32_t bidID;
@property (nonatomic) int32_t contractID;
@property (nonatomic) int32_t bidderID;
@property (nonatomic, strong) NSDate *dateBid;
@property (nonatomic) float amount;

@end

@interface EVEContractBids : EVEResult
@property (nonatomic, strong) NSArray *bidList;

@end
