//
//  EVEMemberSecurity.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMemberSecurityMember : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, strong) NSArray *grantableRoles;
@property (nonatomic, strong) NSArray *rolesAtHQ;
@property (nonatomic, strong) NSArray *grantableRolesAtHQ;
@property (nonatomic, strong) NSArray *rolesAtBase;
@property (nonatomic, strong) NSArray *grantableRolesAtBase;
@property (nonatomic, strong) NSArray *rolesAtOther;
@property (nonatomic, strong) NSArray *grantableRolesAtOther;
@property (nonatomic, strong) NSArray *titles;
@end


@interface EVEMemberSecurityRoleItem : EVEObject
@property (nonatomic) uint64_t roleID;
@property (nonatomic, strong) NSString *roleName;
@end


@interface EVEMemberSecurityTitleItem : EVEObject
@property (nonatomic) int32_t titleID;
@property (nonatomic, strong) NSString *titleName;
@end


@interface EVEMemberSecurity : EVEResult
@property (nonatomic, strong) NSArray *members;
@end