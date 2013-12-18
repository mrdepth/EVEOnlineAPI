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

@interface EVECorpFacWarStats : EVERequest
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic, strong) NSDate *enlisted;
@property (nonatomic) NSInteger pilots;
@property (nonatomic) NSInteger killsYesterday;
@property (nonatomic) NSInteger killsLastWeek;
@property (nonatomic) NSInteger killsTotal;
@property (nonatomic) NSInteger victoryPointsYesterday;
@property (nonatomic) NSInteger victoryPointsLastWeek;
@property (nonatomic) NSInteger victoryPointsTotal;

+ (id) corpFacWarStatsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
