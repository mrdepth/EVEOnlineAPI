//
//  EVEKillLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEKillLogVictim : NSObject {
	NSInteger allianceID;
	NSString *allianceName;
	NSInteger characterID;
	NSString *characterName;
	NSInteger corporationID;
	NSString *corporationName;
	NSInteger damageTaken;
	NSInteger factionID;
	NSString *factionName;
	NSInteger shipTypeID;
}
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

@interface EVEKillLogAttacker : NSObject {
	NSInteger characterID;
	NSString *characterName;
	NSInteger corporationID;
	NSString *corporationName;
	NSInteger allianceID;
	NSString *allianceName;
	float securityStatus;
	NSInteger damageDone;
	BOOL finalBlow;
	NSInteger weaponTypeID;
	NSInteger shipTypeID;
}
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

@interface EVEKillLogItem : NSObject {
	EVEInventoryFlag flag;
	NSInteger qtyDropped;
	NSInteger qtyDestroyed;
	NSInteger typeID;
	NSMutableArray *items;
}
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) NSInteger qtyDropped;
@property (nonatomic) NSInteger qtyDestroyed;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) NSMutableArray *items;

+ (id) killLogItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;


@end

@interface EVEKillLogKill : NSObject {
	NSInteger killID;
	NSInteger solarSystemID;
	NSDate *killTime;
	NSInteger moonID;
	EVEKillLogVictim *victim;
	NSMutableArray *attackers;
	NSMutableArray *items;
}
@property (nonatomic) NSInteger killID;
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic, retain) NSDate *killTime;
@property (nonatomic) NSInteger moonID;
@property (nonatomic, retain) EVEKillLogVictim *victim;
@property (nonatomic, retain) NSMutableArray *attackers;
@property (nonatomic, retain) NSMutableArray *items;

+ (id) killLogKillWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEKillLog : EVERequest {
	NSMutableArray *kills;
}
@property (nonatomic, retain) NSArray *kills;

+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) killLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeKillID: (NSInteger) beforeKillID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;

@end
