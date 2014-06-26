//
//  EVECharacterInfo.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.12.12.
//
//

#import "EVERequest.h"

@interface EVECharacterInfoEmploymentHistoryItem : NSObject<NSCoding>
@property (nonatomic, assign) int32_t recordID;
@property (nonatomic, assign) int32_t corporationID;
@property (nonatomic, strong) NSDate *startDate;

+ (id) characterInfoEmploymentHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacterInfo : EVERequest
@property (nonatomic, assign) int32_t characterID;
@property (nonatomic, copy) NSString* characterName;
@property (nonatomic, copy) NSString* race;
@property (nonatomic, copy) NSString* bloodline;
@property (nonatomic, assign) float accountBalance;
@property (nonatomic, assign) int32_t skillPoints;
@property (nonatomic, copy) NSString* shipName;
@property (nonatomic, assign) int32_t shipTypeID;
@property (nonatomic, copy) NSString* shipTypeName;
@property (nonatomic, assign) int32_t corporationID;
@property (nonatomic, copy) NSString* corporation;
@property (nonatomic, strong) NSDate* corporationDate;
@property (nonatomic, assign) int32_t allianceID;
@property (nonatomic, copy) NSString* alliance;
@property (nonatomic, strong) NSDate* allianceDate;
@property (nonatomic, copy) NSString* lastKnownLocation;
@property (nonatomic, assign) float securityStatus;
@property (nonatomic, strong) NSArray* employmentHistory;

+ (id) characterInfoWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end