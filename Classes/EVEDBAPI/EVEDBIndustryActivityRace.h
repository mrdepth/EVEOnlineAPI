//
//  EVEDBIndustryActivityRace.h
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBObject.h"

@interface EVEDBIndustryActivityRace : EVEDBObject
@property(nonatomic) int32_t typeID;
@property(nonatomic) int32_t activityID;
@property(nonatomic) int32_t productTypeID;
@property(nonatomic) int32_t raceID;
@end
