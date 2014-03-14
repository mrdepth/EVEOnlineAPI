//
//  EVEDBCertSkill.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 22.01.14.
//
//

#import "EVEDBObject.h"

@class EVEDBInvGroup;
@class EVEDBInvType;
@interface EVEDBCertSkill : EVEDBObject
@property (nonatomic, assign) int32_t certificateID;
@property (nonatomic, assign) int32_t skillID;
@property (nonatomic, strong, readonly) EVEDBInvType* skill;
@property (nonatomic, assign) int32_t certificateLevel;
@property (nonatomic, assign) int32_t skillLevel;
@property (nonatomic, strong) NSString* certificateLevelText;

@end
