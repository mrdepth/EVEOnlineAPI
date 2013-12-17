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
@property (nonatomic) NSInteger allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) NSInteger damageTaken;
@property (nonatomic) NSInteger factionID;
@property (nonatomic, copy) NSString *factionName;
@property (nonatomic) NSInteger shipTypeID;

+ (id) killLogVictimWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEKillLogAttacker : NSObject<NSCoding>
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) float securityStatus;
@property (nonatomic) NSInteger damageDone;
@property (nonatomic) BOOL finalBlow;
@property (nonatomic) NSInteger weaponTypeID;
@property (nonatomic) NSInteger shipTypeID;

+ (id) killLogAttackerWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEKillLogItem : NSObject<NSCoding>
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) NSInteger qtyDropped;
@property (nonatomic) NSInteger qtyDestroyed;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, strong) NSMutableArray *items;

+ (id) killLogItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;


@end

@interface EVEKillLogKill : NSObject<NSCoding>
@property (nonatomic) NSInteger killID;
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic, strong) NSDate *killTime;
@property (nonatomic) NSInteger moonID;
@property (nonatomic, strong) EVEKillLogVictim *victim;
@property (nonatomic, strong) NSMutableArray *attackers;
@property (nonatomic, strong) NSMutableArray *items;

+ (id) killLogKillWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEKillLog : EVERequest
@property (nonatomic, strong) NSArray *kills;

+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
