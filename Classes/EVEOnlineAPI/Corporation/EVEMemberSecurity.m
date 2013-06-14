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
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.name = [attributeDict valueForKey:@"name"];
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
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
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
		self.titleID = [[attributeDict valueForKey:@"titleID"] integerValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

@end


@implementation EVEMemberSecurity

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) memberSecurityWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEMemberSecurity alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurity.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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
@end