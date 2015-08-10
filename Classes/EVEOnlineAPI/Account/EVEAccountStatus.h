//
//  EVEAccountStatus.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEAccountStatusMultiCharacterTrainingItem : EVEObject
@property (nonatomic, strong) NSDate* trainingEnd;
@end

@interface EVEAccountStatus : EVEResult
@property (nonatomic, strong) NSDate *paidUntil;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic) int32_t logonCount;
@property (nonatomic) int32_t logonMinutes;
@property (nonatomic, strong) NSArray* multiCharacterTraining;

@end
