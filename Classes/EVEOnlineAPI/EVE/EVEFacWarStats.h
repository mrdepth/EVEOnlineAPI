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
@property (nonatomic) NSInteger killsYesterday;
@property (nonatomic) NSInteger killsLastWeek;
@property (nonatomic) NSInteger killsTotal;
@property (nonatomic) NSInteger victoryPointsYesterday;
@property (nonatomic) NSInteger victoryPointsLastWeek;
@property (nonatomic) NSInteger victoryPointsTotal;
@end


@interface EVEFacWarStatsFactionsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) NSInteger pilots;
@property (nonatomic) NSInteger systemsControlled;
@property (nonatomic) NSInteger killsYesterday;
@property (nonatomic) NSInteger killsLastWeek;
@property (nonatomic) NSInteger killsTotal;
@property (nonatomic) NSInteger victoryPointsYesterday;
@property (nonatomic) NSInteger victoryPointsLastWeek;
@property (nonatomic) NSInteger victoryPointsTotal;

+ (id) facWarStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarStatsFactionWarsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) NSInteger againstID;
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