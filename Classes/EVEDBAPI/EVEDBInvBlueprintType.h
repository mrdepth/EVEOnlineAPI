//
//  EVEDBInvBlueprintType.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import "EVEDBObject.h"

@class EVEDBInvType;
@interface EVEDBInvBlueprintType : EVEDBObject
@property (nonatomic) int32_t blueprintTypeID;
@property (nonatomic, strong) EVEDBInvType* blueprintType;
@property (nonatomic) int32_t parentBlueprintTypeID;
@property (nonatomic, strong) EVEDBInvBlueprintType* parentBlueprintType;
@property (nonatomic) int32_t productTypeID;
@property (nonatomic, strong) EVEDBInvType* productType;
@property (nonatomic) int32_t productionTime;
@property (nonatomic) int32_t techLevel;
@property (nonatomic) int32_t researchProductivityTime;
@property (nonatomic) int32_t researchMaterialTime;
@property (nonatomic) int32_t researchCopyTime;
@property (nonatomic) int32_t researchTechTime;
@property (nonatomic) int32_t productivityModifier;
@property (nonatomic) int32_t materialModifier;
@property (nonatomic) int32_t wasteFactor;
@property (nonatomic) int32_t maxProductionLimit;
@property (nonatomic, strong) NSMutableDictionary* ramTypeRequirements;
@property (nonatomic, strong) NSArray *typeMaterials;


+ (id) invBlueprintTypeWithBlueprintTypeID:(int32_t)aBlueprintTypeID error:(NSError **)errorPtr;
- (id) initWithBlueprintTypeID:(int32_t)aBlueprintTypeID error:(NSError **)errorPtr;

- (NSArray*) activities;
- (NSArray*) requiredSkillsForActivity:(int32_t) activityID;
- (NSArray*) requiredMaterialsForActivity:(int32_t) activityID;
@end
