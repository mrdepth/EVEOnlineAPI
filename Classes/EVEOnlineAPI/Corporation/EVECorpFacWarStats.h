//
//  EVECorpFacWarStats.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpFacWarStats : EVERequest {
	NSInteger factionID;
	NSString *factionName;
	NSDate *enlisted;
	NSInteger pilots;
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
@property (nonatomic) NSInteger pilots;
@property (nonatomic) NSInteger killsYesterday;
@property (nonatomic) NSInteger killsLastWeek;
@property (nonatomic) NSInteger killsTotal;
@property (nonatomic) NSInteger victoryPointsYesterday;
@property (nonatomic) NSInteger victoryPointsLastWeek;
@property (nonatomic) NSInteger victoryPointsTotal;

+ (id) corpFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) corpFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
