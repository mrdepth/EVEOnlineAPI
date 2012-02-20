//
//  EVEStarbaseDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEStarbaseDetailGeneralSettings : NSObject {
	NSInteger usageFlags;
	NSInteger deployFlags;
	BOOL allowCorporationMembers;
	BOOL allowAllianceMembers;
}
@property (nonatomic) NSInteger usageFlags;
@property (nonatomic) NSInteger deployFlags;
@property (nonatomic) BOOL allowCorporationMembers;
@property (nonatomic) BOOL allowAllianceMembers;

@end

@interface EVEStarbaseDetailCombatSettings : NSObject {
	NSInteger useStandingsFromOwnerID;
	NSInteger onStandingDropStading;
	BOOL onStatusDropEnabled;
	NSInteger onStatusDropStanding;
	BOOL onAggressionEnabled;
	NSInteger onCorporationWarEnabled;
}
@property (nonatomic) NSInteger useStandingsFromOwnerID;
@property (nonatomic) NSInteger onStandingDropStading;
@property (nonatomic) BOOL onStatusDropEnabled;
@property (nonatomic) NSInteger onStatusDropStanding;
@property (nonatomic) BOOL onAggressionEnabled;
@property (nonatomic) NSInteger onCorporationWarEnabled;

@end

@interface EVEStarbaseDetailFuelItem : NSObject {
	NSInteger typeID;
	NSInteger quantity;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;

+ (id) starbaseDetailFuelItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEStarbaseDetail : EVERequest {
	NSInteger state;
	NSDate *stateTimestamp;
	NSDate *onlineTimestamp;
	EVEStarbaseDetailGeneralSettings *generalSettings;
	EVEStarbaseDetailCombatSettings *combatSettings;
	NSMutableArray *fuel;
}
@property (nonatomic) NSInteger state;
@property (nonatomic, retain) NSDate *stateTimestamp;
@property (nonatomic, retain) NSDate *onlineTimestamp;
@property (nonatomic, retain) EVEStarbaseDetailGeneralSettings *generalSettings;
@property (nonatomic, retain) EVEStarbaseDetailCombatSettings *combatSettings;
@property (nonatomic, retain) NSArray *fuel;

+ (id) starbaseDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID error:(NSError **)errorPtr;
+ (id) starbaseDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID target:(id)target action:(SEL)action object:(id)object;

@end