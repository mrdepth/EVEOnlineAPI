//
//  EVECharacterSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharacterSheetAttributes : NSObject {
	NSInteger intelligence;
	NSInteger memory;
	NSInteger charisma;
	NSInteger perception;
	NSInteger willpower;
}
@property NSInteger intelligence;
@property NSInteger memory;
@property NSInteger charisma;
@property NSInteger perception;
@property NSInteger willpower;

@end


#pragma mark --

@interface EVECharacterSheetAttributeEnhancer : NSObject {
	EVECharacterAttribute attribute;
	NSString *augmentatorName;
	NSInteger augmentatorValue;
}
@property (nonatomic) EVECharacterAttribute attribute;
@property (nonatomic, copy) NSString *augmentatorName;
@property (nonatomic) NSInteger augmentatorValue;
@end

#pragma mark --

@interface EVECharacterSheetSkill : NSObject {
	NSInteger typeID;
	NSInteger skillpoints;
	NSInteger level;
	BOOL unpublished;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger skillpoints;
@property (nonatomic) NSInteger level;
@property (nonatomic) BOOL unpublished;

+ (id) characterSheetSkillWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

#pragma mark --

@interface EVECharacterSheetRole : NSObject {
	NSInteger roleID;
	NSString *roleName;
}
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) characterSheetRoleWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

#pragma mark --

@interface EVECharacterSheetCorporationTitle : NSObject {
	NSInteger titleID;
	NSString *titleName;
}
@property (nonatomic) NSInteger titleID;
@property (nonatomic, copy) NSString *titleName;

+ (id) characterSheetCorporationTitleWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


#pragma mark --

@interface EVECharacterSheet : EVERequest {
	NSInteger characterID;
	NSString *name;
	NSString *race;
	NSDate *DoB;
	NSString *bloodLine;
	NSString *ancestry;
	NSString *gender;
	NSString *corporationName;
	NSInteger corporationID;
	NSString *allianceName;
	NSInteger allianceID;
	NSString *cloneName;
	NSInteger cloneSkillPoints;
	float balance;
	NSMutableArray *attributeEnhancers;
	EVECharacterSheetAttributes *attributes;
	NSMutableArray *skills;
	NSMutableArray *certificates;
	NSMutableArray *corporationRoles;
	NSMutableArray *corporationRolesAtHQ;
	NSMutableArray *corporationRolesAtBase;
	NSMutableArray *corporationRolesAtOther;
	NSMutableArray *corporationTitles;
	NSMutableDictionary *skillsMap;
	
}

@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *race;
@property (nonatomic, retain) NSDate *DoB;
@property (nonatomic, copy) NSString *bloodLine;
@property (nonatomic, copy) NSString *ancestry;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic, copy) NSString *cloneName;
@property (nonatomic) NSInteger cloneSkillPoints;
@property (nonatomic) float balance;
@property (nonatomic, retain) NSMutableArray *attributeEnhancers;
@property (nonatomic, retain) EVECharacterSheetAttributes *attributes;
@property (nonatomic, retain) NSMutableArray *skills;
@property (nonatomic, retain) NSMutableArray *certificates;
@property (nonatomic, retain) NSMutableArray *corporationRoles;
@property (nonatomic, retain) NSMutableArray *corporationRolesAtHQ;
@property (nonatomic, retain) NSMutableArray *corporationRolesAtBase;
@property (nonatomic, retain) NSMutableArray *corporationRolesAtOther;
@property (nonatomic, retain) NSMutableArray *corporationTitles;
@property (nonatomic, readonly, retain) NSDictionary *skillsMap;

+ (id) characterSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) characterSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
