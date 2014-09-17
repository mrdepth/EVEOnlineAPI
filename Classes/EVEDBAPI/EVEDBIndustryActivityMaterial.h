//
//  EVEDBIndustryActivityMaterial.h
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBObject.h"

@interface EVEDBIndustryActivityMaterial : EVEDBObject
@property(nonatomic) int32_t typeID;
@property(nonatomic) int32_t activityID;
@property(nonatomic) int32_t materialTypeID;
@property(nonatomic) int32_t quantity;
@property(nonatomic) int32_t consume;

@end
