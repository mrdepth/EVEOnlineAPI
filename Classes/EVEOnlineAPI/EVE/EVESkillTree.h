//
//  EVESkillTree.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESkillTreeRequiredAttributes : NSObject<NSCoding>
@property (nonatomic) EVECharacterAttribute primaryAttribute;
@property (nonatomic) EVECharacterAttribute secondaryAttribute;
@end


@interface EVESkillTreeRequiredSkillsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger skillLevel;

+ (id) skillTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESkillTreeSkillBonusCollectionItem : NSObject<NSCoding>
@property (nonatomic, copy) NSString *bonusType;
@property (nonatomic) NSInteger bonusValue;

+ (id) skillTreeSkillBonusCollectionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVESkillTreeSkillGroupsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger groupID;
@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, strong) NSArray *skills;

+ (id) skillTreeSkillGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESkillTreeSkillsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger groupID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) NSInteger rank;
@property (nonatomic, strong) NSArray *requiredSkills;
@property (nonatomic, strong) EVESkillTreeRequiredAttributes *requiredAttributes;
@property (nonatomic, strong) NSArray *skillBonusCollection;	
@property (nonatomic) BOOL published;

+ (id) skillTreeSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESkillTree : EVERequest
@property (nonatomic, strong) NSArray *skillGroups;

+ (id) skillTreeWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end