//
//  EVEFacWarStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarStatsTotals : NSObject<NSCoding>
@property (nonatomic) int32_t killsYesterday;
@property (nonatomic) int32_t killsLastWeek;
@property (nonatomic) int32_t killsTotal;
@property (nonatomic) int32_t victoryPointsYesterday;
@property (nonatomic) int32_t victoryPointsLastWeek;
@property (nonatomic) int32_t victoryPointsTotal;
@end


@interface EVEFacWarStatsFactionsItem : NSObject<NSCoding>
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t pilots;
@property (nonatomic) int32_t systemsControlled;
@property (nonatomic) int32_t killsYesterday;
@property (nonatomic) int32_t killsLastWeek;
@property (nonatomic) int32_t killsTotal;
@property (nonatomic) int32_t victoryPointsYesterday;
@property (nonatomic) int32_t victoryPointsLastWeek;
@property (nonatomic) int32_t victoryPointsTotal;

+ (id) facWarStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarStatsFactionWarsItem : NSObject<NSCoding>
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t againstID;
@property (nonatomic, copy) NSString *againstName;

+ (id) facWarStatsFactionWarsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarStats : EVERequest
@property (nonatomic, strong) EVEFacWarStatsTotals *totals;
@property (nonatomic, strong) NSArray *factions;
@property (nonatomic, strong) NSArray *factionWars;

+ (id) facWarStatsWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end