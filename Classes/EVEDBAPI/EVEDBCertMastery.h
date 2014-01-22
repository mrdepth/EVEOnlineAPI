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
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) NSInteger masteryLevel;
@property (nonatomic, assign) NSInteger certificateID;
@property (nonatomic, strong, readonly) EVEDBCertCertificate* certificate;

@end