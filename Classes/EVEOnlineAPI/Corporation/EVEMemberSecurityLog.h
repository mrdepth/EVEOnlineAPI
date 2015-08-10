//
//  EVEMemberSecurityLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMemberSecurityLogRolesItem : EVEObject
@property (nonatomic) int64_t roleID;
@property (nonatomic, strong) NSString *roleName;
@end

@interface EVEMemberSecurityLogRoleHistoryItem : EVEObject
@property (nonatomic, strong) NSDate *changeTime;
@property (nonatomic) int32_t characterName;
@property (nonatomic, strong) NSString *roleName;
@property (nonatomic) int32_t issuerID;
@property (nonatomic, strong) NSString *issuerName;
@property (nonatomic, strong) NSString *roleLocationType;
@property (nonatomic, assign) NSArray *oldRoles;
@property (nonatomic, assign) NSArray *theNewRoles;
@end

@interface EVEMemberSecurityLog : EVEResult
@property (nonatomic, strong) NSArray *roleHistory;
@end