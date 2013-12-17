//
//  EVEStarbaseDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEStarbaseDetailGeneralSettings : NSObject<NSCoding>
@property (nonatomic) NSInteger usageFlags;
@property (nonatomic) NSInteger deployFlags;
@property (nonatomic) BOOL allowCorporationMembers;
@property (nonatomic) BOOL allowAllianceMembers;

@end

@interface EVEStarbaseDetailCombatSettings : NSObject<NSCoding>
@property (nonatomic) NSInteger useStandingsFromOwnerID;
@property (nonatomic) NSInteger onStandingDropStading;
@property (nonatomic) BOOL onStatusDropEnabled;
@property (nonatomic) NSInteger onStatusDropStanding;
@property (nonatomic) BOOL onAggressionEnabled;
@property (nonatomic) NSInteger onCorporationWarEnabled;

@end

@interface EVEStarbaseDetailFuelItem : NSObject<NSCoding>
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;

+ (id) starbaseDetailFuelItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEStarbaseDetail : EVERequest
@property (nonatomic) NSInteger state;
@property (nonatomic, strong) NSDate *stateTimestamp;
@property (nonatomic, strong) NSDate *onlineTimestamp;
@property (nonatomic, strong) EVEStarbaseDetailGeneralSettings *generalSettings;
@property (nonatomic, strong) EVEStarbaseDetailCombatSettings *combatSettings;
@property (nonatomic, strong) NSArray *fuel;

+ (id) starbaseDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID: (long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end