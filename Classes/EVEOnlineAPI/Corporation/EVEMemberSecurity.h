//
//  EVEMemberSecurity.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberSecurityMember : NSObject {
	NSInteger characterID;
	NSString *name;
	NSMutableArray *roles;
	NSMutableArray *grantableRoles;
	NSMutableArray *rolesAtHQ;
	NSMutableArray *grantableRolesAtHQ;
	NSMutableArray *rolesAtBase;
	NSMutableArray *grantableRolesAtBase;
	NSMutableArray *rolesAtOther;
	NSMutableArray *grantableRolesAtOther;
	NSMutableArray *titles;
}
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSArray *roles;
@property (nonatomic, retain) NSArray *grantableRoles;
@property (nonatomic, retain) NSArray *rolesAtHQ;
@property (nonatomic, retain) NSArray *grantableRolesAtHQ;
@property (nonatomic, retain) NSArray *rolesAtBase;
@property (nonatomic, retain) NSArray *grantableRolesAtBase;
@property (nonatomic, retain) NSArray *rolesAtOther;
@property (nonatomic, retain) NSArray *grantableRolesAtOther;
@property (nonatomic, retain) NSArray *titles;

+ (id) memberSecurityMemberWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMemberSecurityRoleItem : NSObject {
	NSInteger roleID;
	NSString *roleName;
}
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) memberSecurityRoleItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMemberSecurityTitleItem : NSObject {
	NSInteger titleID;
	NSString *titleName;
}
@property (nonatomic) NSInteger titleID;
@property (nonatomic, copy) NSString *titleName;

+ (id) memberSecurityTitleItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMemberSecurity : EVERequest {
	NSMutableArray *members;
}
@property (nonatomic, retain) NSArray *members;

+ (id) memberSecurityWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) memberSecurityWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end