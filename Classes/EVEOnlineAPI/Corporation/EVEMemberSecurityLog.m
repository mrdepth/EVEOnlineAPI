//
//  EVEMemberSecurityLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberSecurityLog.h"

@implementation EVEMemberSecurityLogRolesItem

+ (id) memberSecurityLogRolesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberSecurityLogRolesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
	}
	return self;
}

@end


@implementation EVEMemberSecurityLogRoleHistoryItem

+ (id) memberSecurityLogRoleHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberSecurityLogRoleHistoryItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.changeTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"changeTime"]];
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.roleLocationType = [attributeDict valueForKey:@"roleLocationType"];
	}
	return self;
}

@end


@implementation EVEMemberSecurityLog

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) memberSecurityLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEMemberSecurityLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurityLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"roleHistory"]) {
		self.roleHistory = [[NSMutableArray alloc] init];
		return self.roleHistory;
	}
	else if ([rowset isEqualToString:@"oldRoles"]) {
		NSMutableArray *oldRoles = [[NSMutableArray alloc] init];
		[[self currentRow] setOldRoles:oldRoles];
		return oldRoles;
	}
	else if ([rowset isEqualToString:@"newRoles"]) {
		NSMutableArray *theNewRoles = [[NSMutableArray alloc] init];
		[[self currentRow] setTheNewRoles:theNewRoles];
		return theNewRoles;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"roleHistory"]) {
		EVEMemberSecurityLogRoleHistoryItem *memberSecurityLogRoleHistoryItem = [EVEMemberSecurityLogRoleHistoryItem memberSecurityLogRoleHistoryItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.roleHistory addObject:memberSecurityLogRoleHistoryItem];
		return memberSecurityLogRoleHistoryItem;
	}
	else if ([rowset isEqualToString:@"oldRoles"] || [rowset isEqualToString:@"newRoles"]) {
		EVEMemberSecurityLogRolesItem *memberSecurityLogRolesItem = [EVEMemberSecurityLogRolesItem memberSecurityLogRolesItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityLogRolesItem];
		return memberSecurityLogRolesItem;
	}
	return nil;
}

@end