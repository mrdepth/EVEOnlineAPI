//
//  EVEMemberSecurityLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberSecurityLog.h"

@implementation EVEMemberSecurityLogRolesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"roleID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"roleName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end


@implementation EVEMemberSecurityLogRoleHistoryItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"changeTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"issuerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"issuerName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"roleLocationType":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"oldRoles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityLogRolesItem class]},
				   @"theNewRoles":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityLogRolesItem class]}};
	
	return scheme;
}

@end


@implementation EVEMemberSecurityLog

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"roleHistory":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberSecurityLogRoleHistoryItem class]}};
	
	return scheme;
}

@end