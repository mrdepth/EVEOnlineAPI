//
//  EVEDBDgmEffect.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBDgmEffect : EVEDBObject
@property (nonatomic, assign) NSInteger effectID;
@property (nonatomic, strong) NSString *effectName;
@property (nonatomic, assign) NSInteger effectCategory;
@property (nonatomic, assign) NSInteger preExpression;
@property (nonatomic, assign) NSInteger postExpression;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, assign) NSInteger iconID;
@property (nonatomic, assign) BOOL isOffensive;
@property (nonatomic, assign) BOOL isAssistance;
@property (nonatomic, assign) NSInteger durationAttributeID;
@property (nonatomic, assign) NSInteger trackingSpeedAttributeID;
@property (nonatomic, assign) NSInteger dischargeAttributeID;
@property (nonatomic, assign) NSInteger rangeAttributeID;
@property (nonatomic, assign) NSInteger falloffAttributeID;
@property (nonatomic, assign) BOOL disallowAutoRepeat;
@property (nonatomic, assign) BOOL published;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) BOOL isWarpSafe;
@property (nonatomic, assign) BOOL rangeChance;
@property (nonatomic, assign) BOOL electronicChance;
@property (nonatomic, assign) BOOL propulsionChance;
@property (nonatomic, assign) NSInteger distribution;
@property (nonatomic, strong) NSString *sfxName;
@property (nonatomic, assign) NSInteger npcUsageChanceAttributeID;
@property (nonatomic, assign) NSInteger npcActivationChanceAttributeID;
@property (nonatomic, assign) NSInteger fittingUsageChanceAttributeID;

+ (id) dgmEffectWithEffectID: (NSInteger)aEffectID error:(NSError **)errorPtr;
- (id) initWithEffectID: (NSInteger)aEffectID error:(NSError **)errorPtr;

@end
