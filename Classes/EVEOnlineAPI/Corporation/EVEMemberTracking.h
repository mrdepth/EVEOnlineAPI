//
//  EVEMemberTracking.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberTrackingItem : NSObject
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *startDateTime;
@property (nonatomic) NSInteger baseID;
@property (nonatomic, copy) NSString *base;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSDate *logonDateTime;
@property (nonatomic, strong) NSDate *logoffDateTime;
@property (nonatomic) long long locationID;
@property (nonatomic, copy) NSString *location;
@property (nonatomic) NSInteger shipTypeID;
@property (nonatomic, copy) NSString *shipType;
@property (nonatomic, copy) NSString *roles;
@property (nonatomic, copy) NSString *grantableRoles;

+ (id) memberTrackingItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberTracking : EVERequest
@property (nonatomic, strong) NSArray *members;

+ (id) memberTrackingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end