//
//  EVEMemberSecurity.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberSecurity.h"

@implementation EVEMemberSecurityMember

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"roles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"grantableRoles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"rolesAtHQ":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"grantableRolesAtHQ":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"rolesAtBase":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"grantableRolesAtBase":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"rolesAtOther":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"grantableRolesAtOther":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityRoleItem class]},
				   @"titles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityTitleItem class]}};
	
	return scheme;
}

@end


@implementation EVEMemberSecurityRoleItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"roleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"roleName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end


@implementation EVEMemberSecurityTitleItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"titleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"titleName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}


@end


@implementation EVEMemberSecurity

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"members":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityMember class]}};
	
	return scheme;
}

@end