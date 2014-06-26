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
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic, strong) NSDate *enlisted;
@property (nonatomic) int32_t pilots;
@property (nonatomic) int32_t killsYesterday;
@property (nonatomic) int32_t killsLastWeek;
@property (nonatomic) int32_t killsTotal;
@property (nonatomic) int32_t victoryPointsYesterday;
@property (nonatomic) int32_t victoryPointsLastWeek;
@property (nonatomic) int32_t victoryPointsTotal;

+ (id) corpFacWarStatsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
