//
//  EVEMemberSecurity.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberSecurity.h"

@implementation EVEMemberSecurityMember

+ (id) memberSecurityMemberWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberSecurityMember alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.name = [attributeDict valueForKey:@"name"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:self.roles forKey:@"roles"];
	[aCoder encodeObject:self.grantableRoles forKey:@"grantableRoles"];
	[aCoder encodeObject:self.rolesAtHQ forKey:@"rolesAtHQ"];
	[aCoder encodeObject:self.grantableRolesAtHQ forKey:@"grantableRolesAtHQ"];
	[aCoder encodeObject:self.rolesAtBase forKey:@"rolesAtBase"];
	[aCoder encodeObject:self.grantableRolesAtBase forKey:@"grantableRolesAtBase"];
	[aCoder encodeObject:self.rolesAtOther forKey:@"rolesAtOther"];
	[aCoder encodeObject:self.grantableRolesAtOther forKey:@"grantableRolesAtOther"];
	[aCoder encodeObject:self.titles forKey:@"titles"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.roles = [aDecoder decodeObjectForKey:@"roles"];
		self.grantableRoles = [aDecoder decodeObjectForKey:@"grantableRoles"];
		self.rolesAtHQ = [aDecoder decodeObjectForKey:@"rolesAtHQ"];
		self.grantableRolesAtHQ = [aDecoder decodeObjectForKey:@"grantableRolesAtHQ"];
		self.rolesAtBase = [aDecoder decodeObjectForKey:@"rolesAtBase"];
		self.grantableRolesAtBase = [aDecoder decodeObjectForKey:@"grantableRolesAtBase"];
		self.rolesAtOther = [aDecoder decodeObjectForKey:@"rolesAtOther"];
		self.grantableRolesAtOther = [aDecoder decodeObjectForKey:@"grantableRolesAtOther"];
		self.titles = [aDecoder decodeObjectForKey:@"titles"];
	}
	return self;
}

@end


@implementation EVEMemberSecurityRoleItem

+ (id) memberSecurityRoleItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberSecurityRoleItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] intValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.roleID forKey:@"roleID"];
	[aCoder encodeObject:self.roleName forKey:@"roleName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.roleID = [aDecoder decodeInt32ForKey:@"roleID"];
		self.roleName = [aDecoder decodeObjectForKey:@"roleName"];
	}
	return self;
}

@end


@implementation EVEMemberSecurityTitleItem

+ (id) memberSecurityTitleItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberSecurityTitleItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.titleID = [[attributeDict valueForKey:@"titleID"] intValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.titleID forKey:@"titleID"];
	[aCoder encodeObject:self.titleName forKey:@"titleName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.titleID = [aDecoder decodeInt32ForKey:@"titleID"];
		self.titleName = [aDecoder decodeObjectForKey:@"titleName"];
	}
	return self;
}


@end


@implementation EVEMemberSecurity

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) memberSecurityWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMemberSecurity alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurity.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"roles"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.roles = [NSMutableArray array];
		return member.roles;
	}
	else if ([rowset isEqualToString:@"grantableRoles"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.grantableRoles = [NSMutableArray array];
		return member.grantableRoles;
	}
	else if ([rowset isEqualToString:@"rolesAtHQ"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.rolesAtHQ = [NSMutableArray array];
		return member.rolesAtHQ;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtHQ"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.grantableRolesAtHQ = [NSMutableArray array];
		return member.grantableRolesAtHQ;
	}
	else if ([rowset isEqualToString:@"rolesAtBase"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.rolesAtBase = [NSMutableArray array];
		return member.rolesAtBase;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtBase"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.grantableRolesAtBase = [NSMutableArray array];
		return member.grantableRolesAtBase;
	}
	else if ([rowset isEqualToString:@"rolesAtOther"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.rolesAtOther = [NSMutableArray array];
		return member.rolesAtOther;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtOther"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.grantableRolesAtOther = [NSMutableArray array];
		return member.grantableRolesAtOther;
	}
	else if ([rowset isEqualToString:@"titles"]) {
		EVEMemberSecurityMember *member = [self.members lastObject];
		member.titles = [NSMutableArray array];
		return member.titles;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"roles"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"grantableRoles"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"rolesAtHQ"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtHQ"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"rolesAtBase"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtBase"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"rolesAtOther"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtOther"]) {
		EVEMemberSecurityRoleItem *memberSecurityRoleItem = [EVEMemberSecurityRoleItem memberSecurityRoleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityRoleItem];
		return memberSecurityRoleItem;
	}
	else if ([rowset isEqualToString:@"titles"]) {
		EVEMemberSecurityTitleItem *memberSecurityTitleItem = [EVEMemberSecurityTitleItem memberSecurityTitleItemWithXMLAttributes:attributeDict];
		[object addObject:memberSecurityTitleItem];
		return memberSecurityTitleItem;
	}
	return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"member"]) {
		if (!self.members)
			self.members = [NSMutableArray array];
		EVEMemberSecurityMember *member = [EVEMemberSecurityMember memberSecurityMemberWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.members addObject:member];
	}
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.members forKey:@"members"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.members = [aDecoder decodeObjectForKey:@"members"];
	}
	return self;
}

@end