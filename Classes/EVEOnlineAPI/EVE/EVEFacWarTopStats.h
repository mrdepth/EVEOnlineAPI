//
//  EVEFacWarTopStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEFacWarTopStatsCharactersItem : NSObject {
	NSInteger characterID;
	NSString *characterName;
	NSInteger kills;
}
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger kills;

+ (id) facWarTopStatsCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsCorporationsItem : NSObject {
	NSInteger corporationID;
	NSString *corporationName;
	NSInteger kills;
}
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) NSInteger kills;

+ (id) facWarTopStatsCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsFactionsItem : NSObject {
	NSInteger factionID;
	NSString *factionName;
	NSInteger kills;
}
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) NSInteger kills;

+ (id) facWarTopStatsFactionsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEFacWarTopStatsSection : NSObject {
	NSMutableArray *killsYesterday;
	NSMutableArray *killsLastWeek;
	NSMutableArray *killsTotal;
	NSMutableArray *victoryPointsYesterday;
	NSMutableArray *victoryPointsLastWeek;
	NSMutableArray *victoryPointsTotal;
}
@property (nonatomic, retain) NSArray *killsYesterday;
@property (nonatomic, retain) NSArray *killsLastWeek;
@property (nonatomic, retain) NSArray *killsTotal;
@property (nonatomic, retain) NSArray *victoryPointsYesterday;
@property (nonatomic, retain) NSArray *victoryPointsLastWeek;
@property (nonatomic, retain) NSArray *victoryPointsTotal;

@end


@interface EVEFacWarTopStats : EVERequest {
	EVEFacWarTopStatsSection *characters;
	EVEFacWarTopStatsSection *corporations;
	EVEFacWarTopStatsSection *factions;
	
	EVEFacWarTopStatsSection *currentSection;
}
@property (nonatomic, retain) EVEFacWarTopStatsSection *characters;
@property (nonatomic, retain) EVEFacWarTopStatsSection *corporations;
@property (nonatomic, retain) EVEFacWarTopStatsSection *factions;

+ (id) facWarTopStatsWithError:(NSError **)errorPtr;
+ (id) facWarTopStatsWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end