//
//  EVECustomsOffices.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEResult.h"

@interface EVECustomsOfficesItem : EVEObject
@property (nonatomic) int64_t itemID;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) NSString* solarSystemName;
@property (nonatomic) int32_t reinforceHour;
@property (nonatomic) BOOL allowAlliance;
@property (nonatomic) BOOL allowStandings;
@property (nonatomic) float standingLevel;
@property (nonatomic) float taxRateAlliance;
@property (nonatomic) float taxRateCorp;
@property (nonatomic) float taxRateStandingHigh;
@property (nonatomic) float taxRateStandingGood;
@property (nonatomic) float taxRateStandingNeutral;
@property (nonatomic) float taxRateStandingBad;
@property (nonatomic) float taxRateStandingHorrible;
@end

@interface EVECustomsOffices : EVEResult
@property (nonatomic, strong) NSArray *pocos;

@end
