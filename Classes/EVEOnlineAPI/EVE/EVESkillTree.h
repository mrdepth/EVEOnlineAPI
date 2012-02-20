//
//  EVESkillTree.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESkillTreeRequiredAttributes : NSObject {
	EVECharacterAttribute primaryAttribute;
	EVECharacterAttribute secondaryAttribute;
}
@property (nonatomic) EVECharacterAttribute primaryAttribute;
@property (nonatomic) EVECharacterAttribute secondaryAttribute;
@end


@interface EVESkillTreeRequiredSkillsItem : NSObject {
	NSInteger typeID;
	NSInteger skillLevel;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger skillLevel;

+ (id) skillTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESkillTreeSkillBonusCollectionItem : NSObject {
	NSString *bonusType;
	NSInteger bonusValue;
}
@property (nonatomic, copy) NSString *bonusType;
@property (nonatomic) NSInteger bonusValue;

+ (id) skillTreeSkillBonusCollectionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVESkillTreeSkillGroupsItem : NSObject {
	NSInteger groupID;
	NSString *groupName;
	NSMutableArray *skills;
}
@property (nonatomic) NSInteger groupID;
@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, retain) NSArray *skills;

+ (id) skillTreeSkillGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESkillTreeSkillsItem : NSObject {
	NSInteger groupID;
	NSInteger typeID;
	NSString *typeName;
	NSString *description;
	NSInteger rank;
	NSMutableArray *requiredSkills;
	EVESkillTreeRequiredAttributes *requiredAttributes;
	NSMutableArray *skillBonusCollection;
	BOOL published;
}
@property (nonatomic) NSInteger groupID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) NSInteger rank;
@property (nonatomic, retain) NSArray *requiredSkills;
@property (nonatomic, retain) EVESkillTreeRequiredAttributes *requiredAttributes;
@property (nonatomic, retain) NSArray *skillBonusCollection;	
@property (nonatomic) BOOL published;

+ (id) skillTreeSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESkillTree : EVERequest {
	NSMutableArray *skillGroups;
}
@property (nonatomic, retain) NSArray *skillGroups;

+ (id) skillTreeWithError:(NSError **)errorPtr;
+ (id) skillTreeWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end