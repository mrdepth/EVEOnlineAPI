//
//  EVEFacWarTopStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarTopStatsCharactersItem : NSObject
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger kills;

+ (id) facWarTopStatsCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsCorporationsItem : NSObject
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) NSInteger kills;

+ (id) facWarTopStatsCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsFactionsItem : NSObject
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) NSInteger kills;

+ (id) facWarTopStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsSection : NSObject
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

+ (id) facWarTopStatsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end