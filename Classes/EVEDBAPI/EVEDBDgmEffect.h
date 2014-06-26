//
//  EVEDBDgmEffect.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBDgmEffect : EVEDBObject
@property (nonatomic, assign) int32_t effectID;
@property (nonatomic, strong) NSString *effectName;
@property (nonatomic, assign) int32_t effectCategory;
@property (nonatomic, assign) int32_t preExpression;
@property (nonatomic, assign) int32_t postExpression;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, assign) int32_t iconID;
@property (nonatomic, assign) BOOL isOffensive;
@property (nonatomic, assign) BOOL isAssistance;
@property (nonatomic, assign) int32_t durationAttributeID;
@property (nonatomic, assign) int32_t trackingSpeedAttributeID;
@property (nonatomic, assign) int32_t dischargeAttributeID;
@property (nonatomic, assign) int32_t rangeAttributeID;
@property (nonatomic, assign) int32_t falloffAttributeID;
@property (nonatomic, assign) BOOL disallowAutoRepeat;
@property (nonatomic, assign) BOOL published;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) BOOL isWarpSafe;
@property (nonatomic, assign) BOOL rangeChance;
@property (nonatomic, assign) BOOL electronicChance;
@property (nonatomic, assign) BOOL propulsionChance;
@property (nonatomic, assign) int32_t distribution;
@property (nonatomic, strong) NSString *sfxName;
@property (nonatomic, assign) int32_t npcUsageChanceAttributeID;
@property (nonatomic, assign) int32_t npcActivationChanceAttributeID;
@property (nonatomic, assign) int32_t fittingUsageChanceAttributeID;

+ (id) dgmEffectWithEffectID: (int32_t)aEffectID error:(NSError **)errorPtr;
- (id) initWithEffectID: (int32_t)aEffectID error:(NSError **)errorPtr;

@end
