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

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"intelligence":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"memory":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"charisma":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"perception":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"willpower":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end


@implementation EVECharacterSheetSkill

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"skillpoints":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"level":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"published":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation EVECharacterSheetCertificate

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"certificateID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation EVECharacterSheetRole

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"roleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"roleName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVECharacterSheetCorporationTitle

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"titleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"titleName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVECharacterSheetImplant

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVECharacterSheetJumpClone

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"jumpCloneID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"locationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"cloneName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVECharacterSheetJumpCloneImplant

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"jumpCloneID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVECharacterSheet
@synthesize skillsMap = _skillsMap;

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"homeStationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"DoB":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"race":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"bloodLineID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"bloodLine":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ancestryID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ancestry":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"gender":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"cloneTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"cloneName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"cloneSkillPoints":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"freeSkillPoints":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"freeRespecs":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"cloneJumpDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"lastRespecDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"lastTimedRespec":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"remoteStationDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"jumpClones":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetJumpClone class]},
				   @"jumpCloneImplants":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetJumpCloneImplant class]},
				   @"jumpActivation":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"jumpFatigue":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"jumpLastUpdate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"balance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"implants":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetImplant class]},
				   @"attributes":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVECharacterSheetAttributes class]},
				   @"skills":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetSkill class]},
				   @"certificates":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetCertificate class]},
				   @"corporationRoles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetRole class]},
				   @"corporationRolesAtHQ":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetRole class]},
				   @"corporationRolesAtBase":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetRole class]},
				   @"corporationRolesAtOther":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetRole class]},
				   @"corporationTitles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterSheetCorporationTitle class]}};
	
	return scheme;
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
		NSDate *currentTime = [skillQueue.eveapi serverTimeWithLocalTime:[NSDate date]];
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

@end
