//
//  EVESkillTree.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillTree.h"

@implementation EVESkillTreeRequiredAttributes

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.primaryAttribute forKey:@"primaryAttribute"];
	[aCoder encodeInteger:self.secondaryAttribute forKey:@"secondaryAttribute"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.primaryAttribute = [aDecoder decodeIntegerForKey:@"primaryAttribute"];
		self.secondaryAttribute = [aDecoder decodeIntegerForKey:@"secondaryAttribute"];
	}
	return self;
}

@end


@implementation EVESkillTreeRequiredSkillsItem

+ (id) skillTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVESkillTreeRequiredSkillsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.skillLevel = [[attributeDict valueForKey:@"skillLevel"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeInteger:self.skillLevel forKey:@"skillLevel"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.skillLevel = [aDecoder decodeIntegerForKey:@"skillLevel"];
	}
	return self;
}

@end


@implementation EVESkillTreeSkillBonusCollectionItem

+ (id) skillTreeSkillBonusCollectionItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVESkillTreeSkillBonusCollectionItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.bonusType = [attributeDict valueForKey:@"bonusType"];
		self.bonusValue = [[attributeDict valueForKey:@"bonusValue"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.bonusType forKey:@"bonusType"];
	[aCoder encodeInteger:self.bonusValue forKey:@"bonusValue"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.bonusType = [aDecoder decodeObjectForKey:@"bonusType"];
		self.bonusValue = [aDecoder decodeIntegerForKey:@"bonusValue"];
	}
	return self;
}

@end


@implementation EVESkillTreeSkillGroupsItem

+ (id) skillTreeSkillGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVESkillTreeSkillGroupsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.groupID = [[attributeDict valueForKey:@"groupID"] integerValue];
		self.groupName = [attributeDict valueForKey:@"groupName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.groupID forKey:@"groupID"];
	[aCoder encodeObject:self.groupName forKey:@"groupName"];
	[aCoder encodeObject:self.skills forKey:@"skills"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.groupID = [aDecoder decodeIntegerForKey:@"groupID"];
		self.groupName = [aDecoder decodeObjectForKey:@"groupName"];
		self.skills = [aDecoder decodeObjectForKey:@"skills"];
	}
	return self;
}

@end

	
@implementation EVESkillTreeSkillsItem

+ (id) skillTreeSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVESkillTreeSkillsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.groupID = [[attributeDict valueForKey:@"groupID"] integerValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.typeName = [attributeDict valueForKey:@"typeName"];
		self.published = [[attributeDict valueForKey:@"published"] boolValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.groupID forKey:@"groupID"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeObject:self.typeName forKey:@"typeName"];
	[aCoder encodeObject:self.description forKey:@"description"];
	[aCoder encodeInteger:self.rank forKey:@"rank"];
	[aCoder encodeObject:self.requiredSkills forKey:@"requiredSkills"];
	[aCoder encodeObject:self.requiredAttributes forKey:@"requiredAttributes"];
	[aCoder encodeObject:self.skillBonusCollection forKey:@"skillBonusCollection"];
	[aCoder encodeBool:self.published forKey:@"published"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.groupID = [aDecoder decodeIntegerForKey:@"groupID"];
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
		self.rank = [aDecoder decodeIntegerForKey:@"rank"];
		self.requiredSkills = [aDecoder decodeObjectForKey:@"requiredSkills"];
		self.requiredAttributes = [aDecoder decodeObjectForKey:@"requiredAttributes"];
		self.skillBonusCollection = [aDecoder decodeObjectForKey:@"skillBonusCollection"];
		self.published = [aDecoder decodeBoolForKey:@"published"];
	}
	return self;
}

@end


@implementation EVESkillTree

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) skillTreeWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVESkillTree alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/SkillTree.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"skillGroups"]) {
		self.skillGroups = [[NSMutableArray alloc] init];
		return self.skillGroups;
	}
	else if ([rowset isEqualToString:@"skills"]) {
		NSMutableArray *skills = [NSMutableArray array];
		[self.currentRow setSkills:skills];
		return skills;
	}
	else if ([rowset isEqualToString:@"requiredSkills"]) {
		NSMutableArray *requiredSkills = [NSMutableArray array];
		[self.currentRow setRequiredSkills:requiredSkills];
		return requiredSkills;
	}
	else if ([rowset isEqualToString:@"skillBonusCollection"]) {
		NSMutableArray *skillBonusCollection = [NSMutableArray array];
		[self.currentRow setSkillBonusCollection:skillBonusCollection];
		return skillBonusCollection;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"skillGroups"]) {
		EVESkillTreeSkillGroupsItem *skillTreeSkillGroupsItem = [EVESkillTreeSkillGroupsItem skillTreeSkillGroupsItemWithXMLAttributes:attributeDict];
		[object addObject:skillTreeSkillGroupsItem];
		return skillTreeSkillGroupsItem;
	}
	else if ([rowset isEqualToString:@"skills"]) {
		EVESkillTreeSkillsItem *skillTreeSkillsItem = [EVESkillTreeSkillsItem skillTreeSkillsItemWithXMLAttributes:attributeDict];
		[object addObject:skillTreeSkillsItem];
		return skillTreeSkillsItem;
	}
	else if ([rowset isEqualToString:@"requiredSkills"]) {
		EVESkillTreeRequiredSkillsItem *skillTreeRequiredSkillsItem = [EVESkillTreeRequiredSkillsItem skillTreeRequiredSkillsItemWithXMLAttributes:attributeDict];
		[object addObject:skillTreeRequiredSkillsItem];
		return skillTreeRequiredSkillsItem;
	}
	else if ([rowset isEqualToString:@"skillBonusCollection"]) {
		EVESkillTreeSkillBonusCollectionItem *skillTreeSkillBonusCollectionItem = [EVESkillTreeSkillBonusCollectionItem skillTreeSkillBonusCollectionItemWithXMLAttributes:attributeDict];
		[object addObject:skillTreeSkillBonusCollectionItem];
		return skillTreeSkillBonusCollectionItem;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"requiredAttributes"])
		[self.currentRow setRequiredAttributes:[[EVESkillTreeRequiredAttributes alloc] init]];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"description"])
		[self.currentRow setDescription:self.text];
	else if ([elementName isEqualToString:@"rank"])
		 [self.currentRow setRank:[self.text integerValue]];
	else if ([elementName isEqualToString:@"primaryAttribute"]) {
		if ([self.text isEqualToString:@"intelligence"])
			[[self.currentRow requiredAttributes] setPrimaryAttribute:EVECharacterAttributeIntelligence];
		else if ([self.text isEqualToString:@"memory"])
			[[self.currentRow requiredAttributes] setPrimaryAttribute:EVECharacterAttributeMemory];
		else if ([self.text isEqualToString:@"charisma"])
			[[self.currentRow requiredAttributes] setPrimaryAttribute:EVECharacterAttributeCharisma];
		else if ([self.text isEqualToString:@"perception"])
			[[self.currentRow requiredAttributes] setPrimaryAttribute:EVECharacterAttributePerception];
		else if ([self.text isEqualToString:@"willpower"])
			[[self.currentRow requiredAttributes] setPrimaryAttribute:EVECharacterAttributeWillpower];
	}
	else if ([elementName isEqualToString:@"secondaryAttribute"]) {
		if ([self.text isEqualToString:@"intelligence"])
			[[self.currentRow requiredAttributes] setSecondaryAttribute:EVECharacterAttributeIntelligence];
		else if ([self.text isEqualToString:@"memory"])
			[[self.currentRow requiredAttributes] setSecondaryAttribute:EVECharacterAttributeMemory];
		else if ([self.text isEqualToString:@"charisma"])
			[[self.currentRow requiredAttributes] setSecondaryAttribute:EVECharacterAttributeCharisma];
		else if ([self.text isEqualToString:@"perception"])
			[[self.currentRow requiredAttributes] setSecondaryAttribute:EVECharacterAttributePerception];
		else if ([self.text isEqualToString:@"willpower"])
			[[self.currentRow requiredAttributes] setSecondaryAttribute:EVECharacterAttributeWillpower];
	}
	else if ([elementName isEqualToString:@"cachedUntil"])
		self.cachedUntil = [NSDate dateWithTimeInterval:60*60*24*14 sinceDate:self.currentTime];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.skillGroups forKey:@"skillGroups"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.skillGroups = [aDecoder decodeObjectForKey:@"skillGroups"];
	}
	return self;
}

@end