//
//  EVESkillTree.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVESkillTreeRequiredAttributes : EVEObject
@property (nonatomic) EVECharacterAttribute primaryAttribute;
@property (nonatomic) EVECharacterAttribute secondaryAttribute;
@end


@interface EVESkillTreeRequiredSkillsItem : EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t skillLevel;
@end


@interface EVESkillTreeSkillBonusCollectionItem : EVEObject
@property (nonatomic, copy) NSString *bonusType;
@property (nonatomic) int32_t bonusValue;
@end



@interface EVESkillTreeSkillGroupsItem : EVEObject
@property (nonatomic) int32_t groupID;
@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, strong) NSArray *skills;
@end


@interface EVESkillTreeSkillsItem : EVEObject
@property (nonatomic) int32_t groupID;
@property (nonatomic) int32_t typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *skillDescription;
@property (nonatomic) int32_t rank;
@property (nonatomic, strong) NSArray *requiredSkills;
@property (nonatomic, strong) EVESkillTreeRequiredAttributes *requiredAttributes;
@property (nonatomic, strong) NSArray *skillBonusCollection;	
@property (nonatomic) BOOL published;
@end


@interface EVESkillTree : EVEResult
@property (nonatomic, strong) NSArray *skillGroups;
@end