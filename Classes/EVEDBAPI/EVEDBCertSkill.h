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
@property (nonatomic, assign) NSInteger certificateID;
@property (nonatomic, assign) NSInteger skillID;
@property (nonatomic, strong, readonly) EVEDBInvType* skill;
@property (nonatomic, assign) NSInteger certificateLevel;
@property (nonatomic, assign) NSInteger skillLevel;
@property (nonatomic, strong) NSString* certificateLevelText;

@end
