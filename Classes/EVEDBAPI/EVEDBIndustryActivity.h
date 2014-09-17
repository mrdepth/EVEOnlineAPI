//
//  EVEDBIndustryActivity.h
//  NCDatabase
//
//  Created by Артем Шиманский on 16.09.14.
//
//

#import "EVEDBObject.h"

@interface EVEDBIndustryActivity : EVEDBObject
@property(nonatomic) int32_t typeID;
@property(nonatomic) int32_t time;
@property(nonatomic) int32_t activityID;
@end
