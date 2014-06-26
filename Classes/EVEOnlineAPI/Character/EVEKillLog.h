//
//  EVEKillLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEKillLogVictim : NSObject<NSCoding>
@property (nonatomic) int32_t allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) int32_t damageTaken;
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) int32_t shipTypeID;

+ (id) killLogVictimWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEKillLogAttacker : NSObject<NSCoding>
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) float securityStatus;
@property (nonatomic) int32_t damageDone;
@property (nonatomic) BOOL finalBlow;
@property (nonatomic) int32_t weaponTypeID;
@property (nonatomic) int32_t shipTypeID;

+ (id) killLogAttackerWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEKillLogItem : NSObject<NSCoding>
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) int32_t qtyDropped;
@property (nonatomic) int32_t qtyDestroyed;
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSMutableArray *items;

+ (id) killLogItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;


@end

@interface EVEKillLogKill : NSObject<NSCoding>
@property (nonatomic) int32_t killID;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) NSDate *killTime;
@property (nonatomic) int32_t moonID;
@property (nonatomic, strong) EVEKillLogVictim *victim;
@property (nonatomic, strong) NSMutableArray *attackers;
@property (nonatomic, strong) NSMutableArray *items;

+ (id) killLogKillWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEKillLog : EVERequest
@property (nonatomic, strong) NSArray *kills;

+ (id) killLogWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID beforeKillID: (int32_t) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID beforeKillID: (int32_t) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
