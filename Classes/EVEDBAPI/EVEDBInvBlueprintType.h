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
@property (nonatomic) NSInteger blueprintTypeID;
@property (nonatomic, strong) EVEDBInvType* blueprintType;
@property (nonatomic) NSInteger parentBlueprintTypeID;
@property (nonatomic, strong) EVEDBInvBlueprintType* parentBlueprintType;
@property (nonatomic) NSInteger productTypeID;
@property (nonatomic, strong) EVEDBInvType* productType;
@property (nonatomic) NSInteger productionTime;
@property (nonatomic) NSInteger techLevel;
@property (nonatomic) NSInteger researchProductivityTime;
@property (nonatomic) NSInteger researchMaterialTime;
@property (nonatomic) NSInteger researchCopyTime;
@property (nonatomic) NSInteger researchTechTime;
@property (nonatomic) NSInteger productivityModifier;
@property (nonatomic) NSInteger materialModifier;
@property (nonatomic) NSInteger wasteFactor;
@property (nonatomic) NSInteger maxProductionLimit;
@property (nonatomic, strong) NSMutableDictionary* ramTypeRequirements;
@property (nonatomic, strong) NSArray *typeMaterials;


+ (id) invBlueprintTypeWithBlueprintTypeID:(NSInteger)aBlueprintTypeID error:(NSError **)errorPtr;
- (id) initWithBlueprintTypeID:(NSInteger)aBlueprintTypeID error:(NSError **)errorPtr;

- (NSArray*) activities;
- (NSArray*) requiredSkillsForActivity:(NSInteger) activityID;
- (NSArray*) requiredMaterialsForActivity:(NSInteger) activityID;
@end
