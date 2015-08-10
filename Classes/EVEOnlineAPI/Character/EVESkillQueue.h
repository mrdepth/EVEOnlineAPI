//
//  EVESkillQueue.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "EVEResult.h"

@interface EVESkillQueueItem : EVEObject
@property (nonatomic) int32_t queuePosition;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t level;
@property (nonatomic) int32_t startSP;
@property (nonatomic) int32_t endSP;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;
@end

@interface EVESkillQueue : EVEResult
@property (nonatomic, strong) NSArray *skillQueue;
@property (nonatomic, assign, readonly) NSTimeInterval timeLeft;
@end
