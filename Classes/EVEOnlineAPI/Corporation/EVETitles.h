//
//  EVETitles.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVETitlesItem : EVEObject
@property (nonatomic) int32_t titleID;
@property (nonatomic, strong) NSString *titleName;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, strong) NSArray *grantableRoles;
@property (nonatomic, strong) NSArray *rolesAtHQ;
@property (nonatomic, strong) NSArray *grantableRolesAtHQ;
@property (nonatomic, strong) NSArray *rolesAtBase;
@property (nonatomic, strong) NSArray *grantableRolesAtBase;
@property (nonatomic, strong) NSArray *rolesAtOther;
@property (nonatomic, strong) NSArray *grantableRolesAtOther;
@end

@interface EVETitlesRoleItem : EVEObject
@property (nonatomic) int32_t roleID;
@property (nonatomic, copy) NSString *roleName;
@property (nonatomic, copy) NSString *roleDescription;
@end


@interface EVETitles : EVEResult
@property (nonatomic, strong) NSArray *titles;
@end