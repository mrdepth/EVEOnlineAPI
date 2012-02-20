//
//  EVEFacWarStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarStatsTotals : NSObject {
	NSInteger killsYesterday;
	NSInteger killsLastWeek;
	NSInteger killsTotal;
	NSInteger victoryPointsYesterday;
	NSInteger victoryPointsLastWeek;
	NSInteger victoryPointsTotal;
}
@property (nonatomic) NSInteger killsYesterday;
@property (nonatomic) NSInteger killsLastWeek;
@property (nonatomic) NSInteger killsTotal;
@property (nonatomic) NSInteger victoryPointsYesterday;
@property (nonatomic) NSInteger victoryPointsLastWeek;
@property (nonatomic) NSInteger victoryPointsTotal;
@end


@interface EVEFacWarStatsFactionsItem : NSObject {
	NSInteger factionID;
	NSString *factionName;
	NSInteger pilots;
	NSInteger systemsControlled;
	NSInteger killsYesterday;
	NSInteger killsLastWeek;
	NSInteger killsTotal;
	NSInteger victoryPointsYesterday;
	NSInteger victoryPointsLastWeek;
	NSInteger victoryPointsTotal;
}
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


@interface EVEFacWarStatsFactionWarsItem : NSObject {
	NSInteger factionID;
	NSString *factionName;
	NSInteger againstID;
	NSString *againstName;
}
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) NSInteger againstID;
@property (nonatomic, copy) NSString *againstName;

+ (id) facWarStatsFactionWarsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarStats : EVERequest {
	EVEFacWarStatsTotals *totals;
	NSMutableArray *factions;
	NSMutableArray *factionWars;
}
@property (nonatomic, retain) EVEFacWarStatsTotals *totals;
@property (nonatomic, retain) NSArray *factions;
@property (nonatomic, retain) NSArray *factionWars;

+ (id) facWarStatsWithError:(NSError **)errorPtr;
+ (id) facWarStatsWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end