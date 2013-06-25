//
//  EVEMemberSecurityLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberSecurityLogRolesItem : NSObject
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) memberSecurityLogRolesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberSecurityLogRoleHistoryItem : NSObject
@property (nonatomic, strong) NSDate *changeTime;
@property (nonatomic) NSInteger characterID;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, copy) NSString *roleLocationType;
@property (nonatomic, strong) NSArray *oldRoles;
@property (nonatomic, strong) NSArray *theNewRoles;

+ (id) memberSecurityLogRoleHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberSecurityLog : EVERequest
@property (nonatomic, strong) NSArray *roleHistory;

+ (id) memberSecurityLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end