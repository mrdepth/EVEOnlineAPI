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
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger groupID;
@property (nonatomic, strong) EVEDBInvGroup *group;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) NSInteger graphicID;
@property (nonatomic) float radius;
@property (nonatomic) float mass;
@property (nonatomic) float volume;
@property (nonatomic) float capacity;
@property (nonatomic) NSInteger portionSize;
@property (nonatomic) NSInteger raceID;
@property (nonatomic) float basePrice;
@property (nonatomic) BOOL published;
@property (nonatomic) NSInteger marketGroupID;
@property (nonatomic, strong) EVEDBInvMarketGroup *marketGroup;
@property (nonatomic) float chanceOfDuplicating;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSMutableArray *attributeCategories;
@property (nonatomic, strong) NSMutableDictionary *attributesDictionary;
@property (nonatomic, strong) NSMutableDictionary *effectsDictionary;
@property (nonatomic, strong) NSMutableArray *certificateRecommendations;
@property (nonatomic, strong) NSMutableArray *requiredSkills;
@property (nonatomic, strong) EVEDBInvBlueprintType* blueprintType;
@property (nonatomic, strong) EVEDBInvType* blueprint;

+ (id) invTypeWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr;
+ (id) invTypeWithInvType:(EVEDBInvType*) type;
- (id) initWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr;
- (id) initWithInvType:(EVEDBInvType*) type;
- (NSString*) typeLargeImageName;
- (NSString*) typeSmallImageName;

@end

@interface EVEDBInvTypeRequiredSkill : EVEDBInvType
@property (nonatomic, assign) NSInteger requiredLevel;
@property (nonatomic, readonly, assign) float requiredSP;
@end
