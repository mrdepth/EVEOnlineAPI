//
//  EVEDBInvBlueprintType.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import <Foundation/Foundation.h>

@class EVEDBInvType;
@interface EVEDBInvBlueprintType : NSObject {
	NSInteger blueprintTypeID;
	EVEDBInvType* blueprintType;
	NSInteger parentBlueprintTypeID;
	EVEDBInvBlueprintType* parentBlueprintType;
	NSInteger productTypeID;
	EVEDBInvType* productType;
	NSInteger productionTime;
	NSInteger techLevel;
	NSInteger researchProductivityTime;
	NSInteger researchMaterialTime;
	NSInteger researchCopyTime;
	NSInteger researchTechTime;
	NSInteger productivityModifier;
	NSInteger materialModifier;
	NSInteger wasteFactor;
	NSInteger maxProductionLimit;
	NSMutableDictionary* ramTypeRequirements;
	NSMutableArray *typeMaterials;
}
@property (nonatomic) NSInteger blueprintTypeID;
@property (nonatomic, retain) EVEDBInvType* blueprintType;
@property (nonatomic) NSInteger parentBlueprintTypeID;
@property (nonatomic, retain) EVEDBInvBlueprintType* parentBlueprintType;
@property (nonatomic) NSInteger productTypeID;
@property (nonatomic, retain) EVEDBInvType* productType;
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
@property (nonatomic, retain) NSMutableDictionary* ramTypeRequirements;
@property (nonatomic, retain) NSArray *typeMaterials;


+ (id) invBlueprintTypeWithBlueprintTypeID: (NSInteger)aBlueprintTypeID error:(NSError **)errorPtr;
+ (id) invBlueprintTypeWithDictionary: (NSDictionary*) dictionary;
- (id) initWithBlueprintTypeID: (NSInteger)aBlueprintTypeID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

- (NSArray*) activities;
- (NSArray*) requiredSkillsForActivity:(NSInteger) activityID;
- (NSArray*) requiredMaterialsForActivity:(NSInteger) activityID;
@end
