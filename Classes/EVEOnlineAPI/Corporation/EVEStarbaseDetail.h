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
@property (nonatomic) int32_t usageFlags;
@property (nonatomic) int32_t deployFlags;
@property (nonatomic) BOOL allowCorporationMembers;
@property (nonatomic) BOOL allowAllianceMembers;

@end

@interface EVEStarbaseDetailCombatSettings : NSObject<NSCoding>
@property (nonatomic) int32_t useStandingsFromOwnerID;
@property (nonatomic) int32_t onStandingDropStading;
@property (nonatomic) BOOL onStatusDropEnabled;
@property (nonatomic) int32_t onStatusDropStanding;
@property (nonatomic) BOOL onAggressionEnabled;
@property (nonatomic) int32_t onCorporationWarEnabled;

@end

@interface EVEStarbaseDetailFuelItem : NSObject<NSCoding>
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;

+ (id) starbaseDetailFuelItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEStarbaseDetail : EVERequest
@property (nonatomic) int32_t state;
@property (nonatomic, strong) NSDate *stateTimestamp;
@property (nonatomic, strong) NSDate *onlineTimestamp;
@property (nonatomic, strong) EVEStarbaseDetailGeneralSettings *generalSettings;
@property (nonatomic, strong) EVEStarbaseDetailCombatSettings *combatSettings;
@property (nonatomic, strong) NSArray *fuel;

+ (id) starbaseDetailWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID: (int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID: (int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end