//
//  EVETitles.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVETitlesItem : NSObject<NSCoding>
@property (nonatomic) NSInteger titleID;
@property (nonatomic, copy) NSString *titleName;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, strong) NSArray *grantableRoles;
@property (nonatomic, strong) NSArray *rolesAtHQ;
@property (nonatomic, strong) NSArray *grantableRolesAtHQ;
@property (nonatomic, strong) NSArray *rolesAtBase;
@property (nonatomic, strong) NSArray *grantableRolesAtBase;
@property (nonatomic, strong) NSArray *rolesAtOther;
@property (nonatomic, strong) NSArray *grantableRolesAtOther;

+ (id) titlesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVETitlesRoleItem : NSObject<NSCoding>
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;
@property (nonatomic, copy) NSString *roleDescription;

+ (id) titlesRoleItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVETitles : EVERequest
@property (nonatomic, strong) NSArray *titles;

+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end