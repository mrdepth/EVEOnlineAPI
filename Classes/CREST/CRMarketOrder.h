//
//  CRMarketOrder.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 24.12.15.
//
//

#import "EVEOnlineAPI.h"

@interface CRMarketOrder : EVEMarketOrdersItem
@end

@interface CRMarketOrderCollection : EVEObject
@property (nonatomic, strong) NSArray* items;
@end
