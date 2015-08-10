//
//  EVECharacterInfo.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.12.12.
//
//

#import "EVEResult.h"

@interface EVECharacterInfoEmploymentHistoryItem : EVEObject
@property (nonatomic, assign) int32_t recordID;
@property (nonatomic, assign) int32_t corporationID;
@property (nonatomic, strong) NSString* corporationName;
@property (nonatomic, strong) NSDate *startDate;
@end


@interface EVECharacterInfo : EVEResult
@property (nonatomic, assign) int32_t characterID;
@property (nonatomic, copy) NSString* characterName;
@property (nonatomic, copy) NSString* race;
@property (nonatomic) int32_t bloodLineID;
@property (nonatomic, strong) NSString *bloodLine;
@property (nonatomic) int32_t ancestryID;
@property (nonatomic, strong) NSString *ancestry;
@property (nonatomic, assign) double accountBalance;
@property (nonatomic, assign) int32_t skillPoints;
@property (nonatomic, strong) NSString* shipName;
@property (nonatomic, assign) int32_t shipTypeID;
@property (nonatomic, copy) NSString* shipTypeName;
@property (nonatomic, assign) int32_t corporationID;
@property (nonatomic, strong) NSString* corporation;
@property (nonatomic, strong) NSDate* corporationDate;
@property (nonatomic, assign) int32_t allianceID;
@property (nonatomic, strong) NSString* alliance;
@property (nonatomic, strong) NSDate* allianceDate;
@property (nonatomic, strong) NSString* lastKnownLocation;
@property (nonatomic, assign) float securityStatus;
@property (nonatomic, strong) NSArray* employmentHistory;
@end