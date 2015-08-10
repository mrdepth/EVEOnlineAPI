//
//  EVEContractItems.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEContractItemsItem : EVEObject
@property (nonatomic) int32_t recordID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;
@property (nonatomic) int32_t rawQuantity;
@property (nonatomic) BOOL singleton;
@property (nonatomic) BOOL included;

@end

@interface EVEContractItems : EVEResult
@property (nonatomic, strong) NSArray *itemList;

@end
