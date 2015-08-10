//
//  EVETitles.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVETitles.h"


@implementation EVETitlesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"titleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"titleName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"roles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"grantableRoles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"rolesAtHQ":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"grantableRolesAtHQ":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"rolesAtBase":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"grantableRolesAtBase":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"rolesAtOther":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]},
				   @"grantableRolesAtOther":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesRoleItem class]}};
	
	return scheme;
}

@end


@implementation EVETitlesRoleItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"roleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"roleName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"roleDescription":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end


@implementation EVETitles

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"titles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVETitlesItem class]}};
	
	return scheme;
}

@end