//
//  EVECharacterSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECharacterSheetAttributes : EVEObject
@property int32_t intelligence;
@property int32_t memory;
@property int32_t charisma;
@property int32_t perception;
@property int32_t willpower;
@end


@interface EVECharacterSheetSkill : EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t skillpoints;
@property (nonatomic) int32_t level;
@property (nonatomic) BOOL published;
@end

@interface EVECharacterSheetCertificate : EVEObject
@property (nonatomic) int32_t certificateID;
@end


@interface EVECharacterSheetRole : EVEObject
@property (nonatomic) int32_t roleID;
@property (nonatomic, strong) NSString *roleName;
@end

@interface EVECharacterSheetCorporationTitle : EVEObject
@property (nonatomic) int32_t titleID;
@property (nonatomic, strong) NSString *titleName;
@end


@interface EVECharacterSheetImplant : EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSString *typeName;
@end

@interface EVECharacterSheetJumpClone : EVEObject
@property (nonatomic) int32_t jumpCloneID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int64_t locationID;
@property (nonatomic, strong) NSString *cloneName;
@end

@interface EVECharacterSheetJumpCloneImplant : EVEObject
@property (nonatomic) int32_t jumpCloneID;
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSString *typeName;
@end

@class EVESkillQueue;
@interface EVECharacterSheet : EVEResult
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) int32_t homeStationID;
@property (nonatomic, strong) NSDate *DoB;
@property (nonatomic, strong) NSString *race;
@property (nonatomic) int32_t bloodLineID;
@property (nonatomic, strong) NSString *bloodLine;
@property (nonatomic) int32_t ancestryID;
@property (nonatomic, strong) NSString *ancestry;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *allianceName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, strong) NSString *factionName;
@property (nonatomic) int32_t factionID;
@property (nonatomic) int32_t cloneTypeID;
@property (nonatomic, strong) NSString *cloneName;
@property (nonatomic) int32_t cloneSkillPoints;
@property (nonatomic) int32_t freeSkillPoints;
@property (nonatomic) int32_t freeRespecs;
@property (nonatomic, strong) NSDate *cloneJumpDate;
@property (nonatomic, strong) NSDate *lastRespecDate;
@property (nonatomic, strong) NSDate *lastTimedRespec;
@property (nonatomic, strong) NSDate *remoteStationDate;
@property (nonatomic, strong) NSArray *jumpClones;
@property (nonatomic, strong) NSArray *jumpCloneImplants;
@property (nonatomic, strong) NSDate *jumpActivation;
@property (nonatomic, strong) NSDate *jumpFatigue;
@property (nonatomic, strong) NSDate *jumpLastUpdate;
@property (nonatomic) double balance;
@property (nonatomic, strong) NSArray *implants;
@property (nonatomic, strong) EVECharacterSheetAttributes *attributes;
@property (nonatomic, strong) NSArray *skills;
@property (nonatomic, strong) NSArray *certificates;
@property (nonatomic, strong) NSArray *corporationRoles;
@property (nonatomic, strong) NSArray *corporationRolesAtHQ;
@property (nonatomic, strong) NSArray *corporationRolesAtBase;
@property (nonatomic, strong) NSArray *corporationRolesAtOther;
@property (nonatomic, strong) NSArray *corporationTitles;

@property (nonatomic, strong, readonly) NSDictionary *skillsMap;

- (void) updateSkillPointsFromSkillQueue:(EVESkillQueue*) skillQueue;

@end
