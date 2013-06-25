//
//  EVETitles.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVETitles.h"


@implementation EVETitlesItem

+ (id) titlesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVETitlesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.titleID = [[attributeDict valueForKey:@"titleID"] integerValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

@end


@implementation EVETitlesRoleItem

+ (id) titlesRoleItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVETitlesRoleItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
		self.roleDescription = [attributeDict valueForKey:@"roleDescription"];
	}
	return self;
}

@end


@implementation EVETitles

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVETitles alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Titles.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"titles"]) {
		self.titles = [[NSMutableArray alloc] init];
		return self.titles;
	}
	else if ([rowset isEqualToString:@"roles"]) {
		NSMutableArray *roles = [[NSMutableArray alloc] init];
		[self.currentRow setRoles:roles];
		return roles;
	}
	else if ([rowset isEqualToString:@"grantableRoles"]) {
		NSMutableArray *grantableRoles = [[NSMutableArray alloc] init];
		[self.currentRow setGrantableRoles:grantableRoles];
		return grantableRoles;
	}
	else if ([rowset isEqualToString:@"rolesAtHQ"]) {
		NSMutableArray *rolesAtHQ = [[NSMutableArray alloc] init];
		[self.currentRow setRolesAtHQ:rolesAtHQ];
		return rolesAtHQ;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtHQ"]) {
		NSMutableArray *grantableRolesAtHQ = [[NSMutableArray alloc] init];
		[self.currentRow setGrantableRolesAtHQ:grantableRolesAtHQ];
		return grantableRolesAtHQ;
	}
	else if ([rowset isEqualToString:@"rolesAtBase"]) {
		NSMutableArray *rolesAtBase = [[NSMutableArray alloc] init];
		[self.currentRow setRolesAtBase:rolesAtBase];
		return rolesAtBase;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtBase"]) {
		NSMutableArray *grantableRolesAtBase = [[NSMutableArray alloc] init];
		[self.currentRow setGrantableRolesAtBase:grantableRolesAtBase];
		return grantableRolesAtBase;
	}
	else if ([rowset isEqualToString:@"rolesAtOther"]) {
		NSMutableArray *rolesAtOther = [[NSMutableArray alloc] init];
		[self.currentRow setRolesAtOther:rolesAtOther];
		return rolesAtOther;
	}	else if ([rowset isEqualToString:@"grantableRolesAtOther"]) {
		NSMutableArray *grantableRolesAtOther = [[NSMutableArray alloc] init];
		[self.currentRow setGrantableRolesAtOther:grantableRolesAtOther];
		return grantableRolesAtOther;
	}	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"titles"]) {
		EVETitlesItem *titlesItem = [EVETitlesItem titlesItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.titles addObject:titlesItem];
		return titlesItem;
	}
	else {
		EVETitlesRoleItem *titlesRoleItem = [EVETitlesItem titlesItemWithXMLAttributes:attributeDict];
		[object addObject:titlesRoleItem];
		return titlesRoleItem;
	}
	return nil;
}

@end