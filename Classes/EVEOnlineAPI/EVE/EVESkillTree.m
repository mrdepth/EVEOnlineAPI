//
//  EVESkillTree.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillTree.h"

@implementation EVESkillTreeRequiredAttributes
@synthesize primaryAttribute;
@synthesize secondaryAttribute;
@end


@implementation EVESkillTreeRequiredSkillsItem
@synthesize typeID;
@synthesize skillLevel;

+ (id) skillTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVESkillTreeRequiredSkillsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.skillLevel = [[attributeDict valueForKey:@"skillLevel"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end


@implementation EVESkillTreeSkillBonusCollectionItem
@synthesize bonusType;
@synthesize bonusValue;

+ (id) skillTreeSkillBonusCollectionItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVESkillTreeSkillBonusCollectionItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.bonusType = [attributeDict valueForKey:@"bonusType"];
		self.bonusValue = [[attributeDict valueForKey:@"bonusValue"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[bonusType release];
	[super dealloc];
}

@end


@implementation EVESkillTreeSkillGroupsItem
@synthesize groupID;
@synthesize groupName;
@synthesize skills;

+ (id) skillTreeSkillGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVESkillTreeSkillGroupsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.groupID = [[attributeDict valueForKey:@"groupID"] integerValue];
		self.groupName = [attributeDict valueForKey:@"groupName"];
	}
	return self;
}

- (void) dealloc {
	[groupName release];
	[skills release];
	[super dealloc];
}

@end

	
@implementation EVESkillTreeSkillsItem
@synthesize groupID;
@synthesize typeID;
@synthesize typeName;
@synthesize description;
@synthesize rank;
@synthesize requiredSkills;
@synthesize requiredAttributes;
@synthesize skillBonusCollection;	
@synthesize published;

+ (id) skillTreeSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVESkillTreeSkillsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[typeName release];
	[description release];
	[requiredSkills release];
	[requiredAttributes release];
	[skillBonusCollection release];
	[super dealloc];
}

@end


@implementation EVESkillTree
@synthesize skillGroups;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) skillTreeWithError:(NSError **)errorPtr {
	return [[[EVESkillTree alloc] initWithError:errorPtr] autorelease];
}

+ (id) skillTreeWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVESkillTree alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/SkillTree.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/SkillTree.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[skillGroups release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"skillGroups"]) {
		skillGroups = [[NSMutableArray alloc] init];
		return skillGroups;
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
		[self.currentRow setRequiredAttributes:[[[EVESkillTreeRequiredAttributes alloc] init] autorelease]];
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

@end