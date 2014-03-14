//
//  EVEMemberSecurity.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberSecurityMember : NSObject<NSCoding>
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, strong) NSArray *grantableRoles;
@property (nonatomic, strong) NSArray *rolesAtHQ;
@property (nonatomic, strong) NSArray *grantableRolesAtHQ;
@property (nonatomic, strong) NSArray *rolesAtBase;
@property (nonatomic, strong) NSArray *grantableRolesAtBase;
@property (nonatomic, strong) NSArray *rolesAtOther;
@property (nonatomic, strong) NSArray *grantableRolesAtOther;
@property (nonatomic, strong) NSArray *titles;

+ (id) memberSecurityMemberWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMemberSecurityRoleItem : NSObject<NSCoding>
@property (nonatomic) int32_t roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) memberSecurityRoleItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMemberSecurityTitleItem : NSObject<NSCoding>
@property (nonatomic) int32_t titleID;
@property (nonatomic, copy) NSString *titleName;

+ (id) memberSecurityTitleItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEMemberSecurity : EVERequest
@property (nonatomic, strong) NSArray *members;

+ (id) memberSecurityWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end