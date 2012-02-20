//
//  EVETitles.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVETitles.h"


@implementation EVETitlesItem
@synthesize titleID;
@synthesize titleName;
@synthesize roles;
@synthesize grantableRoles;
@synthesize rolesAtHQ;
@synthesize grantableRolesAtHQ;
@synthesize rolesAtBase;
@synthesize grantableRolesAtBase;
@synthesize rolesAtOther;
@synthesize grantableRolesAtOther;

+ (id) titlesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVETitlesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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
	[roles release];
	[grantableRoles release];
	[rolesAtHQ release];
	[grantableRolesAtHQ release];
	[rolesAtBase release];
	[grantableRolesAtBase release];
	[rolesAtOther release];
	[grantableRolesAtOther release];
	[super dealloc];
}

@end


@implementation EVETitlesRoleItem
@synthesize roleID;
@synthesize roleName;
@synthesize roleDescription;

+ (id) titlesRoleItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVETitlesRoleItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.roleID = [[attributeDict valueForKey:@"roleID"] integerValue];
		self.roleName = [attributeDict valueForKey:@"roleName"];
		self.roleDescription = [attributeDict valueForKey:@"roleDescription"];
	}
	return self;
}

- (void) dealloc {
	[roleName release];
	[roleDescription release];
	[super dealloc];
}

@end


@implementation EVETitles
@synthesize titles;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVETitles alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVETitles alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Titles.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Titles.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[titles release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"titles"]) {
		titles = [[NSMutableArray alloc] init];
		return titles;
	}
	else if ([rowset isEqualToString:@"roles"]) {
		NSMutableArray *roles = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setRoles:roles];
		return roles;
	}
	else if ([rowset isEqualToString:@"grantableRoles"]) {
		NSMutableArray *grantableRoles = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setGrantableRoles:grantableRoles];
		return grantableRoles;
	}
	else if ([rowset isEqualToString:@"rolesAtHQ"]) {
		NSMutableArray *rolesAtHQ = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setRolesAtHQ:rolesAtHQ];
		return rolesAtHQ;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtHQ"]) {
		NSMutableArray *grantableRolesAtHQ = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setGrantableRolesAtHQ:grantableRolesAtHQ];
		return grantableRolesAtHQ;
	}
	else if ([rowset isEqualToString:@"rolesAtBase"]) {
		NSMutableArray *rolesAtBase = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setRolesAtBase:rolesAtBase];
		return rolesAtBase;
	}
	else if ([rowset isEqualToString:@"grantableRolesAtBase"]) {
		NSMutableArray *grantableRolesAtBase = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setGrantableRolesAtBase:grantableRolesAtBase];
		return grantableRolesAtBase;
	}
	else if ([rowset isEqualToString:@"rolesAtOther"]) {
		NSMutableArray *rolesAtOther = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setRolesAtOther:rolesAtOther];
		return rolesAtOther;
	}	else if ([rowset isEqualToString:@"grantableRolesAtOther"]) {
		NSMutableArray *grantableRolesAtOther = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setGrantableRolesAtOther:grantableRolesAtOther];
		return grantableRolesAtOther;
	}	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"titles"]) {
		EVETitlesItem *titlesItem = [EVETitlesItem titlesItemWithXMLAttributes:attributeDict];
		[titles addObject:titlesItem];
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