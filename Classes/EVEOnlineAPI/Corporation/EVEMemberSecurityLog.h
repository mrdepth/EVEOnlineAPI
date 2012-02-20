//
//  EVEMemberSecurityLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberSecurityLogRolesItem : NSObject {
	NSInteger roleID;
	NSString *roleName;
}
@property (nonatomic) NSInteger roleID;
@property (nonatomic, copy) NSString *roleName;

+ (id) memberSecurityLogRolesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberSecurityLogRoleHistoryItem : NSObject {
	NSDate *changeTime;
	NSInteger characterID;
	NSInteger issuerID;
	NSString *roleLocationType;
	NSMutableArray *oldRoles;
	NSMutableArray *newRoles;
}
@property (nonatomic, retain) NSDate *changeTime;
@property (nonatomic) NSInteger characterID;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, copy) NSString *roleLocationType;
@property (nonatomic, retain) NSArray *oldRoles;
@property (nonatomic, retain) NSArray *newRoles;

+ (id) memberSecurityLogRoleHistoryItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberSecurityLog : EVERequest {
	NSMutableArray *roleHistory;
}
@property (nonatomic, retain) NSArray *roleHistory;

+ (id) memberSecurityLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) memberSecurityLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end