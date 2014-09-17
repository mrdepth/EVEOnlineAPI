//
//  EVEDBIndustryActivitySkill.h
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBObject.h"

@interface EVEDBIndustryActivitySkill : EVEDBObject
@property(nonatomic) int32_t typeID;
@property(nonatomic) int32_t activityID;
@property(nonatomic) int32_t skillID;
@property(nonatomic) int32_t level;
@end
