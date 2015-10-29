//
//  EVESkillTree.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillTree.h"

@implementation EVESkillTreeRequiredAttributes

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	id (^transformer)(id) = ^(id value) {
		if ([value isKindOfClass:[NSString class]]) {
			NSString* string = value;
			if ([string isEqualToString:@"intelligence"])
			return @(EVECharacterAttributeIntelligence);
			else if ([string isEqualToString:@"memory"])
			return @(EVECharacterAttributeMemory);
			else if ([string isEqualToString:@"charisma"])
			return @(EVECharacterAttributeCharisma);
			else if ([string isEqualToString:@"perception"])
			return @(EVECharacterAttributePerception);
			else
			return @(EVECharacterAttributeWillpower);
		}
		else
			return @(0);
	};

	if (!scheme)
		scheme = @{@"primaryAttribute":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer": transformer},
				   @"secondaryAttribute":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer": transformer}};
	
	return scheme;
}

@end


@implementation EVESkillTreeRequiredSkillsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"skillLevel":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVESkillTreeSkillBonusCollectionItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"bonusType":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"bonusValue":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVESkillTreeSkillGroupsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"groupID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"groupName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"skills":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVESkillTreeRequiredSkillsItem class]}};
	
	return scheme;
}

@end

	
@implementation EVESkillTreeSkillsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"groupID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"skillDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"},
				   @"rank":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"requiredSkills":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVESkillTreeRequiredSkillsItem class]},
				   @"requiredAttributes":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVESkillTreeRequiredAttributes class]},
				   @"skillBonusCollection":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVESkillTreeSkillBonusCollectionItem class]},
				   @"published":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVESkillTree


+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"skillGroups":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVESkillTreeSkillGroupsItem class]}};
	
	return scheme;
}

@end