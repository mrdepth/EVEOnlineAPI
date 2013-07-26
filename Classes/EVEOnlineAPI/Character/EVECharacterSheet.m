//
//  EVECharacterSheet.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterSheet.h"

@implementation EVECharacterSheetAttributes
@end


#pragma mark --

@implementation EVECharacterSheetAttributeEnhancer
@end

#pragma mark --

@implementation EVECharacterSheetSkill

+ (id) characterSheetSkillWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetSkill alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.skillpoints = [[attributeDict valueForKey:@"skillpoints"] integerValue];
		self.level = [[attributeDict valueForKey:@"level"] integerValue];
		if ([attributeDict valueForKey:@"unpublished"])
			self.unpublished = [[attributeDict valueForKey:@"unpublished"] boolValue];
		else
			self.unpublished = NO;

	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheetRole

+ (id) characterSheetRoleWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetRole alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheetCorporationTitle

+ (id) characterSheetCorporationTitleWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetCorporationTitle alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.titleID = [[attributeDict valueForKey:@"titleID"] integerValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheet

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) characterSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECharacterSheet alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) aCharacterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CharacterSheet.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], aCharacterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSDictionary*) skillsMap {
	if (!_skillsMap) {
		_skillsMap = [[NSMutableDictionary alloc] initWithCapacity:self.skills.count];
		for (EVECharacterSheetSkill* skill in self.skills)
			[(NSMutableDictionary*)self.skillsMap setObject:skill forKey:@(skill.typeID)];
	}
	return _skillsMap;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"skills"])
		return self.skills = [NSMutableArray array];
	else if ([rowset isEqualToString:@"certificates"])
		return self.certificates = [NSMutableArray array];
	else if ([rowset isEqualToString:@"corporationRoles"])
		return self.corporationRoles = [NSMutableArray array];
	else if ([rowset isEqualToString:@"corporationRolesAtHQ"])
		return self.corporationRolesAtHQ = [NSMutableArray array];
	else if ([rowset isEqualToString:@"corporationRolesAtBase"])
		return self.corporationRolesAtBase = [NSMutableArray array];
	else if ([rowset isEqualToString:@"corporationRolesAtOther"])
		return self.corporationRolesAtOther = [NSMutableArray array];
	else if ([rowset isEqualToString:@"corporationTitles"])
		return self.corporationTitles = [NSMutableArray array];
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"skills"])
		[self.skills addObject:[EVECharacterSheetSkill characterSheetSkillWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"certificates"])
		[self.certificates addObject:[attributeDict valueForKey:@"certificateID"]];
	else if ([rowset isEqualToString:@"corporationRoles"])
		[self.corporationRoles addObject:[EVECharacterSheetRole characterSheetRoleWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"corporationRolesAtHQ"])
		[self.corporationRolesAtHQ addObject:[EVECharacterSheetRole characterSheetRoleWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"corporationRolesAtBase"])
		[self.corporationRolesAtBase addObject:[EVECharacterSheetRole characterSheetRoleWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"corporationRolesAtOther"])
		[self.corporationRolesAtOther addObject:[EVECharacterSheetRole characterSheetRoleWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"corporationTitles"])
		[self.corporationTitles addObject:[EVECharacterSheetCorporationTitle characterSheetCorporationTitleWithXMLAttributes:attributeDict]];
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"attributes"]) {
		self.attributes = [[EVECharacterSheetAttributes alloc] init];
	}
	else if ([elementName isEqualToString:@"attributeEnhancers"])
		self.attributeEnhancers = [NSMutableArray array];
	else if ([elementName isEqualToString:@"willpowerBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeWillpower;
		[self.attributeEnhancers addObject:attributeEnhancer];
	}
	else if ([elementName isEqualToString:@"charismaBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeCharisma;
		[self.attributeEnhancers addObject:attributeEnhancer];
	}
	else if ([elementName isEqualToString:@"perceptionBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributePerception;
		[self.attributeEnhancers addObject:attributeEnhancer];
	}
	else if ([elementName isEqualToString:@"memoryBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeMemory;
		[self.attributeEnhancers addObject:attributeEnhancer];
	}
	else if ([elementName isEqualToString:@"intelligenceBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeIntelligence;
		[self.attributeEnhancers addObject:attributeEnhancer];
	}
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"characterID"])
		self.characterID = [self.text integerValue];
	else if ([elementName isEqualToString:@"name"])
		self.name = self.text;
	else if ([elementName isEqualToString:@"race"])
		self.race = self.text;
	else if ([elementName isEqualToString:@"DoB"])
		self.DoB = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"bloodLine"])
		self.bloodLine = self.text;
	else if ([elementName isEqualToString:@"ancestry"])
		self.ancestry = self.text;
	else if ([elementName isEqualToString:@"gender"])
		self.gender = self.text;
	else if ([elementName isEqualToString:@"corporationName"])
		self.corporationName = self.text;
	else if ([elementName isEqualToString:@"corporationID"])
		self.corporationID = [self.text integerValue];
	else if ([elementName isEqualToString:@"allianceName"])
		self.allianceName = self.text;
	else if ([elementName isEqualToString:@"allianceID"])
		self.allianceID = [self.text integerValue];
	else if ([elementName isEqualToString:@"cloneName"])
		self.cloneName = self.text;
	else if ([elementName isEqualToString:@"cloneSkillPoints"])
		self.cloneSkillPoints = [self.text integerValue];
	else if ([elementName isEqualToString:@"balance"])
		self.balance = [self.text floatValue];
	else if ([elementName isEqualToString:@"augmentatorName"])
		[[self.attributeEnhancers lastObject] setAugmentatorName:self.text];
	else if ([elementName isEqualToString:@"augmentatorValue"])
		[[self.attributeEnhancers lastObject] setAugmentatorValue:[self.text integerValue]];
	else if ([elementName isEqualToString:@"intelligence"])
		self.attributes.intelligence = [self.text integerValue];
	else if ([elementName isEqualToString:@"memory"])
		self.attributes.memory = [self.text integerValue];
	else if ([elementName isEqualToString:@"charisma"])
		self.attributes.charisma = [self.text integerValue];
	else if ([elementName isEqualToString:@"perception"])
		self.attributes.perception = [self.text integerValue];
	else if ([elementName isEqualToString:@"willpower"])
		self.attributes.willpower = [self.text integerValue];
}

@end
