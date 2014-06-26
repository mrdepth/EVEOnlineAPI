//
//  EVEMemberTracking.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberTrackingItem : NSObject<NSCoding>
@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *startDateTime;
@property (nonatomic) int32_t baseID;
@property (nonatomic, copy) NSString *base;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSDate *logonDateTime;
@property (nonatomic, strong) NSDate *logoffDateTime;
@property (nonatomic) int32_t locationID;
@property (nonatomic, copy) NSString *location;
@property (nonatomic) int32_t shipTypeID;
@property (nonatomic, copy) NSString *shipType;
@property (nonatomic, copy) NSString *roles;
@property (nonatomic, copy) NSString *grantableRoles;

+ (id) memberTrackingItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberTracking : EVERequest
@property (nonatomic, strong) NSArray *members;

+ (id) memberTrackingWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end