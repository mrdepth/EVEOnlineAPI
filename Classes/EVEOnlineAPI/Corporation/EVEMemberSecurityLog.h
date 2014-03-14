//
//  EVEMemberSecurityLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberSecurityLogRolesItem : NSObject<NSCoding>
@property (nonatomic) int32_t roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) memberSecurityLogRolesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberSecurityLogRoleHistoryItem : NSObject<NSCoding>
@property (nonatomic, strong) NSDate *changeTime;
@property (nonatomic) int32_t characterID;
@property (nonatomic) int32_t issuerID;
@property (nonatomic, copy) NSString *roleLocationType;
@property (nonatomic, strong) NSArray *oldRoles;
@property (nonatomic, strong) NSArray *theNewRoles;

+ (id) memberSecurityLogRoleHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberSecurityLog : EVERequest
@property (nonatomic, strong) NSArray *roleHistory;

+ (id) memberSecurityLogWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end