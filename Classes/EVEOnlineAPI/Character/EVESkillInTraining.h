//
//  EVESkillInTraining.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVESkillInTraining : EVEResult
@property (nonatomic, strong) NSDate *currentTQTime;
@property (nonatomic, strong) NSDate *trainingEndTime;
@property (nonatomic, strong) NSDate *trainingStartTime;
@property (nonatomic) int32_t trainingTypeID;
@property (nonatomic) int32_t trainingStartSP;
@property (nonatomic) int32_t trainingDestinationSP;
@property (nonatomic) int32_t trainingToLevel;
@property (nonatomic) int32_t skillInTraining;
@end