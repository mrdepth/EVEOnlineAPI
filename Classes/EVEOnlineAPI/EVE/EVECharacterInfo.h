//
//  EVECharacterInfo.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.12.12.
//
//

#import "EVERequest.h"

@interface EVECharacterInfoEmploymentHistoryItem : NSObject
@property (nonatomic, assign) NSInteger recordID;
@property (nonatomic, assign) NSInteger corporationID;
@property (nonatomic, retain) NSDate *startDate;

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
@property (nonatomic, retain) NSDate* corporationDate;
@property (nonatomic, assign) NSInteger allianceID;
@property (nonatomic, copy) NSString* alliance;
@property (nonatomic, retain) NSDate* allianceDate;
@property (nonatomic, copy) NSString* lastKnownLocation;
@property (nonatomic, assign) float securityStatus;
@property (nonatomic, retain) NSArray* employmentHistory;

+ (id) characterInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) characterInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
@end