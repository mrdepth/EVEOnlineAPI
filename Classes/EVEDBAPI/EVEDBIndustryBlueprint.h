//
//  EVEDBIndustryBlueprint.h
//  NCDatabase
//
//  Created by Артем Шиманский on 17.09.14.
//
//

#import "EVEDBObject.h"

@interface EVEDBIndustryBlueprint : EVEDBObject
@property(nonatomic) int32_t typeID;
@property(nonatomic) int32_t maxProductionLimit;
@end
