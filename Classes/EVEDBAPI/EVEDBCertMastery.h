//
//  EVEDBCertMastery.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 22.01.14.
//
//

#import "EVEDBObject.h"

@class EVEDBInvGroup;
@class EVEDBCertCertificate;
@interface EVEDBCertMastery : EVEDBObject
@property (nonatomic, assign) int32_t typeID;
@property (nonatomic, assign) int32_t masteryLevel;
@property (nonatomic, assign) int32_t certificateID;
@property (nonatomic, strong, readonly) EVEDBCertCertificate* certificate;

@end