//
//  EVEDBDgmEffect.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBDgmEffect : NSObject {
	NSInteger effectID;
	NSString *effectName;
	NSInteger effectCategory;
	NSInteger preExpression;
	NSInteger postExpression;
	NSString *description;
	NSString *guid;
	NSInteger iconID;
	BOOL isOffensive;
	BOOL isAssistance;
	NSInteger durationAttributeID;
	NSInteger trackingSpeedAttributeID;
	NSInteger dischargeAttributeID;
	NSInteger rangeAttributeID;
	NSInteger falloffAttributeID;
	BOOL disallowAutoRepeat;
	BOOL published;
	NSString *displayName;
	BOOL isWarpSafe;
	BOOL rangeChance;
	BOOL electronicChance;
	BOOL propulsionChance;
	NSInteger distribution;
	NSString *sfxName;
	NSInteger npcUsageChanceAttributeID;
	NSInteger npcActivationChanceAttributeID;
	NSInteger fittingUsageChanceAttributeID;
}
@property (nonatomic, assign) NSInteger effectID;
@property (nonatomic, retain) NSString *effectName;
@property (nonatomic, assign) NSInteger effectCategory;
@property (nonatomic, assign) NSInteger preExpression;
@property (nonatomic, assign) NSInteger postExpression;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *guid;
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
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, assign) BOOL isWarpSafe;
@property (nonatomic, assign) BOOL rangeChance;
@property (nonatomic, assign) BOOL electronicChance;
@property (nonatomic, assign) BOOL propulsionChance;
@property (nonatomic, assign) NSInteger distribution;
@property (nonatomic, retain) NSString *sfxName;
@property (nonatomic, assign) NSInteger npcUsageChanceAttributeID;
@property (nonatomic, assign) NSInteger npcActivationChanceAttributeID;
@property (nonatomic, assign) NSInteger fittingUsageChanceAttributeID;

+ (id) dgmEffectWithEffectID: (NSInteger)aEffectID error:(NSError **)errorPtr;
+ (id) dgmEffectWithDictionary: (NSDictionary*) dictionary;
- (id) initWithEffectID: (NSInteger)aEffectID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
