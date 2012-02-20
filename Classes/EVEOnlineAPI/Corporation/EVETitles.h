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

@interface EVETitlesItem : NSObject {
	NSInteger titleID;
	NSString *titleName;
	NSMutableArray *roles;
	NSMutableArray *grantableRoles;
	NSMutableArray *rolesAtHQ;
	NSMutableArray *grantableRolesAtHQ;
	NSMutableArray *rolesAtBase;
	NSMutableArray *grantableRolesAtBase;
	NSMutableArray *rolesAtOther;
	NSMutableArray *grantableRolesAtOther;
}
@property (nonatomic) NSInteger titleID;
@property (nonatomic, copy) NSString *titleName;
@property (nonatomic, retain) NSArray *roles;
@property (nonatomic, retain) NSArray *grantableRoles;
@property (nonatomic, retain) NSArray *rolesAtHQ;
@property (nonatomic, retain) NSArray *grantableRolesAtHQ;
@property (nonatomic, retain) NSArray *rolesAtBase;
@property (nonatomic, retain) NSArray *grantableRolesAtBase;
@property (nonatomic, retain) NSArray *rolesAtOther;
@property (nonatomic, retain) NSArray *grantableRolesAtOther;

+ (id) titlesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVETitlesRoleItem : NSObject {
	NSInteger roleID;
	NSString *roleName;
	NSString *roleDescription;
}
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;
@property (nonatomic, copy) NSString *roleDescription;

+ (id) titlesRoleItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVETitles : EVERequest {
	NSMutableArray *titles;
}
@property (nonatomic, retain) NSArray *titles;

+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) titlesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end