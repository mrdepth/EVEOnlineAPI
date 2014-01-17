//
//  EVECentralMarketStat.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECentralRequest.h"

@interface EVECentralMarketStatTypeStat : NSObject<NSCoding>
@property (nonatomic) float volume;
@property (nonatomic) float avg;
@property (nonatomic) float max;
@property (nonatomic) float min;
@property (nonatomic) float stddev;
@property (nonatomic) float median;

+ (id) marketStatTypeStat;

@end


@interface EVECentralMarketStatType: NSObject<NSCoding>
@property (nonatomic) NSInteger typeID;
@property (nonatomic, strong) EVECentralMarketStatTypeStat *all;
@property (nonatomic, strong) EVECentralMarketStatTypeStat *buy;
@property (nonatomic, strong) EVECentralMarketStatTypeStat *sell;

+ (id) marketStatTypeStatWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end

@interface EVECentralMarketStat : EVECentralRequest
@property (nonatomic, strong) NSArray *types;

+ (id) marketStatWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
