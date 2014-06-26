//
//  EVEDBCertCertificate.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 22.01.14.
//
//

#import "EVEDBObject.h"


@class EVEDBInvGroup;
@interface EVEDBCertCertificate : EVEDBObject
@property (nonatomic, assign) int32_t certificateID;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, assign) int32_t groupID;
@property (nonatomic, strong, readonly) EVEDBInvGroup* group;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong, readonly) NSArray* skills;

+ (id) certCertificateWithCertificateID: (int32_t)certificateID error:(NSError **)errorPtr;
- (id) initWithCertificateID: (int32_t)certificateID error:(NSError **)errorPtr;

+ (NSString*) iconImageNameWithMasteryLevel:(int32_t) masteryLevel;
@end
