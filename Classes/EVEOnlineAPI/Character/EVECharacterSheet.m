//
//  EVECharacterSheet.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterSheet.h"

@implementation EVECharacterSheetAttributes
@synthesize intelligence;
@synthesize memory;
@synthesize charisma;
@synthesize perception;
@synthesize willpower;

@end


#pragma mark --

@implementation EVECharacterSheetAttributeEnhancer
@synthesize attribute;
@synthesize augmentatorName;
@synthesize augmentatorValue;

- (void) dealloc {
	[augmentatorName release];
	[super dealloc];
}

@end

#pragma mark --

@implementation EVECharacterSheetSkill
@synthesize typeID;
@synthesize skillpoints;
@synthesize level;
@synthesize unpublished;

+ (id) characterSheetSkillWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharacterSheetSkill alloc] initWithXMLAttributes:attributeDict] autorelease];
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
@synthesize roleID;
@synthesize roleName;

+ (id) characterSheetRoleWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharacterSheetRole alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
	}
	return self;
}

- (void) dealloc {
	[roleName release];
	[super dealloc];
}

@end

#pragma mark --

@implementation EVECharacterSheetCorporationTitle
@synthesize titleID;
@synthesize titleName;

+ (id) characterSheetCorporationTitleWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharacterSheetCorporationTitle alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.titleID = [[attributeDict valueForKey:@"titleID"] integerValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

- (void) dealloc {
	[titleName release];
	[super dealloc];
}

@end

#pragma mark --

@implementation EVECharacterSheet

@synthesize characterID;
@synthesize name;
@synthesize race;
@synthesize DoB;
@synthesize bloodLine;
@synthesize ancestry;
@synthesize gender;
@synthesize corporationName;
@synthesize corporationID;
@synthesize allianceName;
@synthesize allianceID;
@synthesize cloneName;
@synthesize cloneSkillPoints;
@synthesize balance;
@synthesize attributeEnhancers;
@synthesize attributes;
@synthesize skills;
@synthesize certificates;
@synthesize corporationRoles;
@synthesize corporationRolesAtHQ;
@synthesize corporationRolesAtBase;
@synthesize corporationRolesAtOther;
@synthesize corporationTitles;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) characterSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVECharacterSheet alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) characterSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECharacterSheet alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) aCharacterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CharacterSheet.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, aCharacterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) aCharacterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CharacterSheet.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, aCharacterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[name release];
	[race release];
	[DoB release];
	[bloodLine release];
	[ancestry release];
	[gender release];
	[corporationName release];
	[allianceName release];
	[cloneName release];
	[attributeEnhancers release];
	[attributes release];
	[skills release];
	[certificates release];
	[corporationRoles release];
	[corporationRolesAtHQ release];
	[corporationRolesAtBase release];
	[corporationRolesAtOther release];
	[corporationTitles release];
	[skillsMap release];
	
	[super dealloc];
}

- (NSDictionary*) skillsMap {
	if (!skillsMap) {
		skillsMap = [[NSMutableDictionary alloc] initWithCapacity:skills.count];
		for (EVECharacterSheetSkill* skill in skills)
			[skillsMap setValue:skill forKey:[NSString stringWithFormat:@"%d", skill.typeID]];
	}
	return skillsMap;
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
		self.attributes = [[[EVECharacterSheetAttributes alloc] init] autorelease];
	}
	else if ([elementName isEqualToString:@"attributeEnhancers"])
		self.attributeEnhancers = [NSMutableArray array];
	else if ([elementName isEqualToString:@"willpowerBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeWillpower;
		[self.attributeEnhancers addObject:attributeEnhancer];
		[attributeEnhancer release];
	}
	else if ([elementName isEqualToString:@"charismaBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeCharisma;
		[self.attributeEnhancers addObject:attributeEnhancer];
		[attributeEnhancer release];
	}
	else if ([elementName isEqualToString:@"perceptionBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributePerception;
		[self.attributeEnhancers addObject:attributeEnhancer];
		[attributeEnhancer release];
	}
	else if ([elementName isEqualToString:@"memoryBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeMemory;
		[self.attributeEnhancers addObject:attributeEnhancer];
		[attributeEnhancer release];
	}
	else if ([elementName isEqualToString:@"intelligenceBonus"]) {
		EVECharacterSheetAttributeEnhancer *attributeEnhancer = [[EVECharacterSheetAttributeEnhancer alloc] init];
		attributeEnhancer.attribute = EVECharacterAttributeIntelligence;
		[self.attributeEnhancers addObject:attributeEnhancer];
		[attributeEnhancer release];		
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
