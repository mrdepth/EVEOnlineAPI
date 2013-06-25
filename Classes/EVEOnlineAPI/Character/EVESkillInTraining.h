//
//  EVESkillInTraining.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESkillInTraining : EVERequest
@property (nonatomic, strong) NSDate *currentTQTime;
@property (nonatomic, strong) NSDate *trainingEndTime;
@property (nonatomic, strong) NSDate *trainingStartTime;
@property (nonatomic) NSInteger trainingTypeID;
@property (nonatomic) NSInteger trainingStartSP;
@property (nonatomic) NSInteger trainingDestinationSP;
@property (nonatomic) NSInteger trainingToLevel;
@property (nonatomic) NSInteger skillInTraining;

+ (id) skillInTrainingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end