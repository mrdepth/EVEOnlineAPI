//
//  EVEFacWarTopStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarTopStatsCharactersItem : NSObject<NSCoding>
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) int32_t kills;

+ (id) facWarTopStatsCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsCorporationsItem : NSObject<NSCoding>
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) int32_t kills;

+ (id) facWarTopStatsCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsFactionsItem : NSObject<NSCoding>
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t kills;

+ (id) facWarTopStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsSection : NSObject<NSCoding>
@property (nonatomic, strong) NSArray *killsYesterday;
@property (nonatomic, strong) NSArray *killsLastWeek;
@property (nonatomic, strong) NSArray *killsTotal;
@property (nonatomic, strong) NSArray *victoryPointsYesterday;
@property (nonatomic, strong) NSArray *victoryPointsLastWeek;
@property (nonatomic, strong) NSArray *victoryPointsTotal;

@end


@interface EVEFacWarTopStats : EVERequest
@property (nonatomic, strong) EVEFacWarTopStatsSection *characters;
@property (nonatomic, strong) EVEFacWarTopStatsSection *corporations;
@property (nonatomic, strong) EVEFacWarTopStatsSection *factions;

+ (id) facWarTopStatsWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end