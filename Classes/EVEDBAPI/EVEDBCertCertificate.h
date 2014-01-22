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
@property (nonatomic, assign) NSInteger certificateID;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, assign) NSInteger groupID;
@property (nonatomic, strong, readonly) EVEDBInvGroup* group;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong, readonly) NSArray* skills;

+ (id) certCertificateWithCertificateID: (NSInteger)certificateID error:(NSError **)errorPtr;
- (id) initWithCertificateID: (NSInteger)certificateID error:(NSError **)errorPtr;

@end
