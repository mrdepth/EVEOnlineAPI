//
//  EVEMemberSecurityLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberSecurityLog.h"

@implementation EVEMemberSecurityLogRolesItem
@synthesize roleID;
@synthesize roleName;

+ (id) memberSecurityLogRolesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMemberSecurityLogRolesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
	}
	return self;
}

- (void) dealloc {
	[roleName release];
	[super dealloc];
}


@end


@implementation EVEMemberSecurityLogRoleHistoryItem
@synthesize changeTime;
@synthesize characterID;
@synthesize issuerID;
@synthesize roleLocationType;
@synthesize oldRoles;
@synthesize theNewRoles;


+ (id) memberSecurityLogRoleHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMemberSecurityLogRoleHistoryItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[changeTime release];
	[roleLocationType release];
	[oldRoles release];
	[theNewRoles release];
	[super dealloc];
}

@end


@implementation EVEMemberSecurityLog
@synthesize roleHistory;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) memberSecurityLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEMemberSecurityLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) memberSecurityLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMemberSecurityLog alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurityLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurityLog.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[roleHistory release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"roleHistory"]) {
		roleHistory = [[NSMutableArray alloc] init];
		return roleHistory;
	}
	else if ([rowset isEqualToString:@"oldRoles"]) {
		NSMutableArray *oldRoles = [[[NSMutableArray alloc] init] autorelease];
		[[self currentRow] setOldRoles:oldRoles];
		return oldRoles;
	}
	else if ([rowset isEqualToString:@"newRoles"]) {
		NSMutableArray *theNewRoles = [[[NSMutableArray alloc] init] autorelease];
		[[self currentRow] setTheNewRoles:theNewRoles];
		return theNewRoles;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"roleHistory"]) {
		EVEMemberSecurityLogRoleHistoryItem *memberSecurityLogRoleHistoryItem = [EVEMemberSecurityLogRoleHistoryItem memberSecurityLogRoleHistoryItemWithXMLAttributes:attributeDict];
		[roleHistory addObject:memberSecurityLogRoleHistoryItem];
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