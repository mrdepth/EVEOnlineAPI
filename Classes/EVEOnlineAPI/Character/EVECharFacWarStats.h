//
//  EVECharFacWarStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharFacWarStats : EVERequest {
	NSInteger factionID;
	NSString *factionName;
	NSDate *enlisted;
	NSInteger currentRank;
	NSInteger highestRank;
	NSInteger killsYesterday;
	NSInteger killsLastWeek;
	NSInteger killsTotal;
	NSInteger victoryPointsYesterday;
	NSInteger victoryPointsLastWeek;
	NSInteger victoryPointsTotal;
}
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic, retain) NSDate *enlisted;
@property (nonatomic) NSInteger currentRank;
@property (nonatomic) NSInteger highestRank;
@property (nonatomic) NSInteger killsYesterday;
@property (nonatomic) NSInteger killsLastWeek;
@property (nonatomic) NSInteger killsTotal;
@property (nonatomic) NSInteger victoryPointsYesterday;
@property (nonatomic) NSInteger victoryPointsLastWeek;
@property (nonatomic) NSInteger victoryPointsTotal;

+ (id) charFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) charFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
