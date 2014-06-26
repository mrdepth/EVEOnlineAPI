//
//  EVEDBInvType.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"
#import "EVEDBDgmAttributeCategory.h"

@interface EVEDBInvTypeAttributeCategory: EVEDBDgmAttributeCategory
@property (nonatomic, strong) NSMutableArray *publishedAttributes;
@property (nonatomic, strong) NSMutableArray *unpublishedAttributes;
@end

@class EVEDBInvGroup;
@class EVEDBInvMarketGroup;
@class EVEDBEveIcon;
@class EVEDBInvBlueprintType;
@interface EVEDBInvType : EVEDBObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t groupID;
@property (nonatomic, strong) EVEDBInvGroup *group;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) int32_t graphicID;
@property (nonatomic) float radius;
@property (nonatomic) float mass;
@property (nonatomic) float volume;
@property (nonatomic) float capacity;
@property (nonatomic) int32_t portionSize;
@property (nonatomic) int32_t raceID;
@property (nonatomic) float basePrice;
@property (nonatomic) BOOL published;
@property (nonatomic) int32_t marketGroupID;
@property (nonatomic, strong) EVEDBInvMarketGroup *marketGroup;
@property (nonatomic) float chanceOfDuplicating;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSMutableArray *attributeCategories;
@property (nonatomic, strong) NSMutableDictionary *attributesDictionary;
@property (nonatomic, strong) NSMutableDictionary *effectsDictionary;
@property (nonatomic, strong, readonly) NSArray *masteries;
@property (nonatomic, strong, readonly) NSArray *requiredSkills;
@property (nonatomic, strong) EVEDBInvBlueprintType* blueprintType;
@property (nonatomic, strong) EVEDBInvType* blueprint;
@property (nonatomic, strong, readonly) NSArray* traits;
@property (nonatomic, strong, readonly) NSString* traitsString;

+ (id) invTypeWithTypeID: (int32_t)aTypeID error:(NSError **)errorPtr;
+ (id) invTypeWithInvType:(EVEDBInvType*) type;
- (id) initWithTypeID: (int32_t)aTypeID error:(NSError **)errorPtr;
- (id) initWithInvType:(EVEDBInvType*) type;
- (NSString*) typeLargeImageName;
- (NSString*) typeSmallImageName;

@end

@interface EVEDBInvTypeRequiredSkill : EVEDBInvType
@property (nonatomic, assign) int32_t requiredLevel;
@property (nonatomic, readonly, assign) float requiredSkillPoints;
@end
