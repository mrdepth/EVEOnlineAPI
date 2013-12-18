//
//  EVECharacterInfo.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.12.12.
//
//

#import "EVERequest.h"

@interface EVECharacterInfoEmploymentHistoryItem : NSObject<NSCoding>
@property (nonatomic, assign) NSInteger recordID;
@property (nonatomic, assign) NSInteger corporationID;
@property (nonatomic, strong) NSDate *startDate;

+ (id) characterInfoEmploymentHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacterInfo : EVERequest
@property (nonatomic, assign) NSInteger characterID;
@property (nonatomic, copy) NSString* characterName;
@property (nonatomic, copy) NSString* race;
@property (nonatomic, copy) NSString* bloodline;
@property (nonatomic, assign) float accountBalance;
@property (nonatomic, assign) NSInteger skillPoints;
@property (nonatomic, copy) NSString* shipName;
@property (nonatomic, assign) NSInteger shipTypeID;
@property (nonatomic, copy) NSString* shipTypeName;
@property (nonatomic, assign) NSInteger corporationID;
@property (nonatomic, copy) NSString* corporation;
@property (nonatomic, strong) NSDate* corporationDate;
@property (nonatomic, assign) NSInteger allianceID;
@property (nonatomic, copy) NSString* alliance;
@property (nonatomic, strong) NSDate* allianceDate;
@property (nonatomic, copy) NSString* lastKnownLocation;
@property (nonatomic, assign) float securityStatus;
@property (nonatomic, strong) NSArray* employmentHistory;

+ (id) characterInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end