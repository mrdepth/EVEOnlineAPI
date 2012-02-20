//
//  EVESkillInTraining.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESkillInTraining : EVERequest {
	NSDate *currentTQTime;
	NSDate *trainingEndTime;
	NSDate *trainingStartTime;
	NSInteger trainingTypeID;
	NSInteger trainingStartSP;
	NSInteger trainingDestinationSP;
	NSInteger trainingToLevel;
	NSInteger skillInTraining;
}
@property (nonatomic, retain) NSDate *currentTQTime;
@property (nonatomic, retain) NSDate *trainingEndTime;
@property (nonatomic, retain) NSDate *trainingStartTime;
@property (nonatomic) NSInteger trainingTypeID;
@property (nonatomic) NSInteger trainingStartSP;
@property (nonatomic) NSInteger trainingDestinationSP;
@property (nonatomic) NSInteger trainingToLevel;
@property (nonatomic) NSInteger skillInTraining;

+ (id) skillInTrainingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) skillInTrainingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
@end