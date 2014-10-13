//
//  EVECharacterSheet.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterSheet.h"
#import "EVESkillQueue.h"

@implementation EVECharacterSheetAttributes

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.intelligence forKey:@"intelligence"];
	[aCoder encodeInt32:self.memory forKey:@"memory"];
	[aCoder encodeInt32:self.charisma forKey:@"charisma"];
	[aCoder encodeInt32:self.perception forKey:@"perception"];
	[aCoder encodeInt32:self.willpower forKey:@"willpower"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.intelligence = [aDecoder decodeInt32ForKey:@"intelligence"];
		self.memory = [aDecoder decodeInt32ForKey:@"memory"];
		self.charisma = [aDecoder decodeInt32ForKey:@"charisma"];
		self.perception = [aDecoder decodeInt32ForKey:@"perception"];
		self.willpower = [aDecoder decodeInt32ForKey:@"willpower"];
	}
	return self;
}

@end


/*#pragma mark --

@implementation EVECharacterSheetAttributeEnhancer

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.attribute forKey:@"attribute"];
	[aCoder encodeObject:self.augmentatorName forKey:@"augmentatorName"];
	[aCoder encodeInt32:self.augmentatorValue forKey:@"augmentatorValue"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.attribute = [aDecoder decodeInt32ForKey:@"attribute"];
		self.augmentatorName = [aDecoder decodeObjectForKey:@"augmentatorName"];
		self.augmentatorValue = [aDecoder decodeInt32ForKey:@"augmentatorValue"];
	}
	return self;
}

@end*/

#pragma mark --

@implementation EVECharacterSheetSkill

+ (id) characterSheetSkillWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetSkill alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.skillpoints = [[attributeDict valueForKey:@"skillpoints"] intValue];
		self.level = [[attributeDict valueForKey:@"level"] intValue];
		if ([attributeDict valueForKey:@"unpublished"])
			self.unpublished = [[attributeDict valueForKey:@"unpublished"] boolValue];
		else
			self.unpublished = NO;

	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.skillpoints forKey:@"skillpoints"];
	[aCoder encodeInt32:self.level forKey:@"level"];
	[aCoder encodeBool:self.unpublished forKey:@"unpublished"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.skillpoints = [aDecoder decodeInt32ForKey:@"skillpoints"];
		self.level = [aDecoder decodeInt32ForKey:@"level"];
		self.unpublished = [aDecoder decodeBoolForKey:@"unpublished"];
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
		self.roleID = [[attributeDict valueForKey:@"roleID"] intValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.roleID forKey:@"roleID"];
	[aCoder encodeObject:self.roleName forKey:@"roleName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.roleID = [aDecoder decodeInt32ForKey:@"roleID"];
		self.roleName = [aDecoder decodeObjectForKey:@"roleName"];
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
		self.titleID = [[attributeDict valueForKey:@"titleID"] intValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.titleID forKey:@"titleID"];
	[aCoder encodeObject:self.titleName forKey:@"titleName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.titleID = [aDecoder decodeInt32ForKey:@"titleID"];
		self.titleName = [aDecoder decodeObjectForKey:@"titleName"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheetImplant

+ (id) characterSheetImplantWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetImplant alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.typeName = [attributeDict valueForKey:@"typeName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeObject:self.typeName forKey:@"titleName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheetJumpClone

+ (id) characterSheetJumpCloneWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetJumpClone alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.jumpCloneID = [[attributeDict valueForKey:@"jumpCloneID"] intValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
		self.cloneName = [attributeDict valueForKey:@"cloneName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.jumpCloneID forKey:@"jumpCloneID"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt64:self.locationID forKey:@"locationID"];
	[aCoder encodeObject:self.cloneName forKey:@"cloneName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.jumpCloneID = [aDecoder decodeInt32ForKey:@"jumpCloneID"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.locationID = [aDecoder decodeInt64ForKey:@"locationID"];
		self.cloneName = [aDecoder decodeObjectForKey:@"cloneName"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheetJumpCloneImplant

+ (id) characterSheetJumpCloneImplantWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterSheetJumpCloneImplant alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.jumpCloneID = [[attributeDict valueForKey:@"jumpCloneID"] intValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.typeName = [attributeDict valueForKey:@"typeName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.jumpCloneID forKey:@"jumpCloneID"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeObject:self.typeName forKey:@"typeName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.jumpCloneID = [aDecoder decodeInt32ForKey:@"jumpCloneID"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.typeName = [aDecoder decodeObjectForKey:@"typeName"];
	}
	return self;
}

@end

#pragma mark --

@implementation EVECharacterSheet

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) characterSheetWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharacterSheet alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) aCharacterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/CharacterSheet.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], aCharacterID]]
					   cachePolicy:cachePolicy
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

- (void) updateSkillPointsFromSkillQueue:(EVESkillQueue*) skillQueue {
	if (skillQueue) {
		NSDate *currentTime = [skillQueue serverTimeWithLocalTime:[NSDate date]];
		for (EVESkillQueueItem *item in skillQueue.skillQueue) {
			if (item.endTime && item.startTime) {
				EVECharacterSheetSkill *skill = self.skillsMap[@(item.typeID)];
				if (item.endTime && item.startTime) {
					float spps = (item.endSP - item.startSP) / [item.endTime timeIntervalSinceDate:item.startTime];
					if (spps > 0) {
						if (item.queuePosition == 0)
							skill.skillpoints = item.endSP - [item.endTime timeIntervalSinceDate:currentTime] * spps;
						else if (item.level - 1 == skill.level)
							skill.skillpoints = item.endSP - [item.endTime timeIntervalSinceDate:item.startTime] * spps;
					}
				}
			}
		}
	}
}

#pragma mark - NSXMLParserDelegate

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
	else if ([rowset isEqualToString:@"implants"])
		return self.implants = [NSMutableArray array];
	else if ([rowset isEqualToString:@"jumpClones"])
		return self.jumpClones = [NSMutableArray array];
	else if ([rowset isEqualToString:@"jumpCloneImplants"])
		return self.jumpCloneImplants = [NSMutableArray array];
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
	else if ([rowset isEqualToString:@"implants"])
		[self.implants addObject:[EVECharacterSheetImplant characterSheetImplantWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"jumpClones"])
		[self.implants addObject:[EVECharacterSheetJumpClone characterSheetJumpCloneWithXMLAttributes:attributeDict]];
	else if ([rowset isEqualToString:@"jumpCloneImplants"])
		[self.jumpCloneImplants addObject:[EVECharacterSheetJumpCloneImplant characterSheetJumpCloneImplantWithXMLAttributes:attributeDict]];
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
/*	else if ([elementName isEqualToString:@"attributeEnhancers"])
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
	}*/
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"characterID"])
		self.characterID = [self.text intValue];
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
		self.corporationID = [self.text intValue];
	else if ([elementName isEqualToString:@"allianceName"])
		self.allianceName = self.text;
	else if ([elementName isEqualToString:@"allianceID"])
		self.allianceID = [self.text intValue];
	else if ([elementName isEqualToString:@"cloneName"])
		self.cloneName = self.text;
	else if ([elementName isEqualToString:@"cloneSkillPoints"])
		self.cloneSkillPoints = [self.text intValue];
	else if ([elementName isEqualToString:@"balance"])
		self.balance = [self.text floatValue];
/*	else if ([elementName isEqualToString:@"augmentatorName"])
		[[self.attributeEnhancers lastObject] setAugmentatorName:self.text];
	else if ([elementName isEqualToString:@"augmentatorValue"])
		[[self.attributeEnhancers lastObject] setAugmentatorValue:[self.text intValue]];*/
	else if ([elementName isEqualToString:@"intelligence"])
		self.attributes.intelligence = [self.text intValue];
	else if ([elementName isEqualToString:@"memory"])
		self.attributes.memory = [self.text intValue];
	else if ([elementName isEqualToString:@"charisma"])
		self.attributes.charisma = [self.text intValue];
	else if ([elementName isEqualToString:@"perception"])
		self.attributes.perception = [self.text intValue];
	else if ([elementName isEqualToString:@"willpower"])
		self.attributes.willpower = [self.text intValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:self.race forKey:@"race"];
	[aCoder encodeObject:self.DoB forKey:@"DoB"];
	[aCoder encodeObject:self.bloodLine forKey:@"bloodLine"];
	[aCoder encodeObject:self.ancestry forKey:@"ancestry"];
	[aCoder encodeObject:self.gender forKey:@"gender"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	[aCoder encodeInt32:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.allianceName forKey:@"allianceName"];
	[aCoder encodeInt32:self.allianceID forKey:@"allianceID"];
	[aCoder encodeObject:self.cloneName forKey:@"cloneName"];
	[aCoder encodeInt32:self.cloneSkillPoints forKey:@"cloneSkillPoints"];
	[aCoder encodeFloat:self.balance forKey:@"balance"];
//	[aCoder encodeObject:self.attributeEnhancers forKey:@"attributeEnhancers"];
	[aCoder encodeObject:self.attributes forKey:@"attributes"];
	[aCoder encodeObject:self.skills forKey:@"skills"];
	[aCoder encodeObject:self.certificates forKey:@"certificates"];
	[aCoder encodeObject:self.corporationRoles forKey:@"corporationRoles"];
	[aCoder encodeObject:self.corporationRolesAtHQ forKey:@"corporationRolesAtHQ"];
	[aCoder encodeObject:self.corporationRolesAtBase forKey:@"corporationRolesAtBase"];
	[aCoder encodeObject:self.corporationRolesAtOther forKey:@"corporationRolesAtOther"];
	[aCoder encodeObject:self.corporationTitles forKey:@"corporationTitles"];
	[aCoder encodeObject:self.implants forKey:@"implants"];
	[aCoder encodeObject:self.jumpClones forKey:@"jumpClonse"];
	[aCoder encodeObject:self.jumpCloneImplants forKey:@"jumpCloneImplants"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.race = [aDecoder decodeObjectForKey:@"race"];
		self.DoB = [aDecoder decodeObjectForKey:@"DoB"];
		self.bloodLine = [aDecoder decodeObjectForKey:@"bloodLine"];
		self.ancestry = [aDecoder decodeObjectForKey:@"ancestry"];
		self.gender = [aDecoder decodeObjectForKey:@"gender"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		self.corporationID = [aDecoder decodeInt32ForKey:@"corporationID"];
		self.allianceName = [aDecoder decodeObjectForKey:@"allianceName"];
		self.allianceID = [aDecoder decodeInt32ForKey:@"allianceID"];
		self.cloneName = [aDecoder decodeObjectForKey:@"cloneName"];
		self.cloneSkillPoints = [aDecoder decodeInt32ForKey:@"cloneSkillPoints"];
		self.balance = [aDecoder decodeFloatForKey:@"balance"];
//		self.attributeEnhancers = [aDecoder decodeObjectForKey:@"attributeEnhancers"];
		self.attributes = [aDecoder decodeObjectForKey:@"attributes"];
		self.skills = [aDecoder decodeObjectForKey:@"skills"];
		self.certificates = [aDecoder decodeObjectForKey:@"certificates"];
		self.corporationRoles = [aDecoder decodeObjectForKey:@"corporationRoles"];
		self.corporationRolesAtHQ = [aDecoder decodeObjectForKey:@"corporationRolesAtHQ"];
		self.corporationRolesAtBase = [aDecoder decodeObjectForKey:@"corporationRolesAtBase"];
		self.corporationRolesAtOther = [aDecoder decodeObjectForKey:@"corporationRolesAtOther"];
		self.corporationTitles = [aDecoder decodeObjectForKey:@"corporationTitles"];
		self.implants = [aDecoder decodeObjectForKey:@"implants"];
		self.jumpClones = [aDecoder decodeObjectForKey:@"jumpClones"];
		self.jumpCloneImplants = [aDecoder decodeObjectForKey:@"jumpCloneImplants"];
	}
	return self;
}

@end
