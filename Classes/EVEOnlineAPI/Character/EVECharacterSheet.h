//
//  EVECharacterSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharacterSheetAttributes : NSObject<NSCoding>
@property NSInteger intelligence;
@property NSInteger memory;
@property NSInteger charisma;
@property NSInteger perception;
@property NSInteger willpower;

@end


#pragma mark --

@interface EVECharacterSheetAttributeEnhancer : NSObject<NSCoding>
@property (nonatomic) EVECharacterAttribute attribute;
@property (nonatomic, copy) NSString *augmentatorName;
@property (nonatomic) NSInteger augmentatorValue;
@end

#pragma mark --

@interface EVECharacterSheetSkill : NSObject<NSCoding>
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger skillpoints;
@property (nonatomic) NSInteger level;
@property (nonatomic) BOOL unpublished;

+ (id) characterSheetSkillWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

#pragma mark --

@interface EVECharacterSheetRole : NSObject<NSCoding>
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) characterSheetRoleWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

#pragma mark --

@interface EVECharacterSheetCorporationTitle : NSObject<NSCoding>
@property (nonatomic) NSInteger titleID;
@property (nonatomic, copy) NSString *titleName;

+ (id) characterSheetCorporationTitleWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


#pragma mark --

@class EVESkillQueue;
@interface EVECharacterSheet : EVERequest
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *race;
@property (nonatomic, strong) NSDate *DoB;
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
@property (nonatomic, strong) NSMutableArray *attributeEnhancers;
@property (nonatomic, strong) EVECharacterSheetAttributes *attributes;
@property (nonatomic, strong) NSMutableArray *skills;
@property (nonatomic, strong) NSMutableArray *certificates;
@property (nonatomic, strong) NSMutableArray *corporationRoles;
@property (nonatomic, strong) NSMutableArray *corporationRolesAtHQ;
@property (nonatomic, strong) NSMutableArray *corporationRolesAtBase;
@property (nonatomic, strong) NSMutableArray *corporationRolesAtOther;
@property (nonatomic, strong) NSMutableArray *corporationTitles;
@property (nonatomic, strong) NSDictionary *skillsMap;

+ (id) characterSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

- (void) updateSkillPointsFromSkillQueue:(EVESkillQueue*) skillQueue;
@end
