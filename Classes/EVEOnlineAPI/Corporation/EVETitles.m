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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.titleID forKey:@"titleID"];
	[aCoder encodeObject:self.titleName forKey:@"titleName"];
	[aCoder encodeObject:self.roles forKey:@"roles"];
	[aCoder encodeObject:self.grantableRoles forKey:@"grantableRoles"];
	[aCoder encodeObject:self.rolesAtHQ forKey:@"rolesAtHQ"];
	[aCoder encodeObject:self.grantableRolesAtHQ forKey:@"grantableRolesAtHQ"];
	[aCoder encodeObject:self.rolesAtBase forKey:@"rolesAtBase"];
	[aCoder encodeObject:self.grantableRolesAtBase forKey:@"grantableRolesAtBase"];
	[aCoder encodeObject:self.rolesAtOther forKey:@"rolesAtOther"];
	[aCoder encodeObject:self.grantableRolesAtOther forKey:@"grantableRolesAtOther"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.titleID = [aDecoder decodeIntegerForKey:@"titleID"];
		self.titleName = [aDecoder decodeObjectForKey:@"titleName"];
		self.roles = [aDecoder decodeObjectForKey:@"roles"];
		self.grantableRoles = [aDecoder decodeObjectForKey:@"grantableRoles"];
		self.rolesAtHQ = [aDecoder decodeObjectForKey:@"rolesAtHQ"];
		self.grantableRolesAtHQ = [aDecoder decodeObjectForKey:@"grantableRolesAtHQ"];
		self.rolesAtBase = [aDecoder decodeObjectForKey:@"rolesAtBase"];
		self.grantableRolesAtBase = [aDecoder decodeObjectForKey:@"grantableRolesAtBase"];
		self.rolesAtOther = [aDecoder decodeObjectForKey:@"rolesAtOther"];
		self.grantableRolesAtOther = [aDecoder decodeObjectForKey:@"grantableRolesAtOther"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.roleID forKey:@"roleID"];
	[aCoder encodeObject:self.roleName forKey:@"roleName"];
	[aCoder encodeObject:self.roleDescription forKey:@"roleDescription"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.roleID = [aDecoder decodeIntegerForKey:@"roleID"];
		self.roleName = [aDecoder decodeObjectForKey:@"roleName"];
		self.roleDescription = [aDecoder decodeObjectForKey:@"roleDescription"];
	}
	return self;
}

@end


@implementation EVETitles

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVETitles alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.titles forKey:@"titles"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.titles = [aDecoder decodeObjectForKey:@"titles"];
	}
	return self;
}

@end