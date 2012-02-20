//
//  EVEMemberSecurity.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberSecurity.h"

@implementation EVEMemberSecurityMember
@synthesize characterID;
@synthesize name;
@synthesize roles;
@synthesize grantableRoles;
@synthesize rolesAtHQ;
@synthesize grantableRolesAtHQ;
@synthesize rolesAtBase;
@synthesize grantableRolesAtBase;
@synthesize rolesAtOther;
@synthesize grantableRolesAtOther;
@synthesize titles;

+ (id) memberSecurityMemberWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMemberSecurityMember alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.name = [attributeDict valueForKey:@"name"];
	}
	return self;
}

- (void) dealloc {
	[name release];
	[roles release];
	[grantableRoles release];
	[rolesAtHQ release];
	[grantableRolesAtHQ release];
	[rolesAtBase release];
	[grantableRolesAtBase release];
	[rolesAtOther release];
	[grantableRolesAtOther release];
	[titles release];
	[super dealloc];
}

@end


@implementation EVEMemberSecurityRoleItem
@synthesize roleID;
@synthesize roleName;

+ (id) memberSecurityRoleItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMemberSecurityRoleItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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


@implementation EVEMemberSecurityTitleItem
@synthesize titleID;
@synthesize titleName;

+ (id) memberSecurityTitleItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMemberSecurityTitleItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.titleID = [[attributeDict valueForKey:@"titleID"] integerValue];
		self.titleName = [attributeDict valueForKey:@"titleName"];
	}
	return self;
}

- (void) dealloc {
	[titleName release];
	[super dealloc];
}

@end


@implementation EVEMemberSecurity
@synthesize members;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) memberSecurityWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEMemberSecurity alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) memberSecurityWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMemberSecurity alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurity.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberSecurity.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[members release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"roles"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.roles = [NSMutableArray array];
		return member.roles;
	}
	else if ([rowset isEqualToString:@"grantableRoles"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.grantableRoles = [NSMutableArray array];
		return member.grantableRoles;
	}
	else if ([rowset isEqualToString:@"rolesAtHQ"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.rolesAtHQ = [NSMutableArray array];
		return member.rolesAtHQ;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtHQ"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.grantableRolesAtHQ = [NSMutableArray array];
		return member.grantableRolesAtHQ;
	}
	else if ([rowset isEqualToString:@"rolesAtBase"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.rolesAtBase = [NSMutableArray array];
		return member.rolesAtBase;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtBase"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.grantableRolesAtBase = [NSMutableArray array];
		return member.grantableRolesAtBase;
	}
	else if ([rowset isEqualToString:@"rolesAtOther"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.rolesAtOther = [NSMutableArray array];
		return member.rolesAtOther;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtOther"]) {
		EVEMemberSecurityMember *member = [members lastObject];
		member.grantableRolesAtOther = [NSMutableArray array];
		return member.grantableRolesAtOther;
	}
	else if ([rowset isEqualToString:@"titles"]) {
		EVEMemberSecurityMember *member = [members lastObject];
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
		if (!members)
			self.members = [NSMutableArray array];
		EVEMemberSecurityMember *member = [EVEMemberSecurityMember memberSecurityMemberWithXMLAttributes:attributeDict];
		[members addObject:member];
	}
}
@end