//
//  CRMarketHistory.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 04.02.16.
//
//

#import "EVEObject.h"

@interface CRMarketHistory : EVEObject
@property (nonatomic, assign) int32_t orderCount;
@property (nonatomic, assign) double lowPrice;
@property (nonatomic, assign) double highPrice;
@property (nonatomic, assign) double avgPrice;
@property (nonatomic, assign) int32_t volume;
@property (nonatomic, strong) NSDate* date;
@end


@interface CRMarketHistoryCollection : EVEObject
@property (nonatomic, strong) NSArray<CRMarketHistory*>* items;
+ (NSString*) contentType;

@end
