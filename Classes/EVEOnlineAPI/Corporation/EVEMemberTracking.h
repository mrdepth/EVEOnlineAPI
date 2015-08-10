//
//  EVEMemberTracking.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMemberTrackingItem : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *startDateTime;
@property (nonatomic) int32_t baseID;
@property (nonatomic, strong) NSString *base;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *logonDateTime;
@property (nonatomic, strong) NSDate *logoffDateTime;
@property (nonatomic) int32_t locationID;
@property (nonatomic, strong) NSString *location;
@property (nonatomic) int32_t shipTypeID;
@property (nonatomic, strong) NSString *shipType;
@property (nonatomic, assign) uint64_t roles;
@property (nonatomic, assign) uint64_t grantableRoles;
@end

@interface EVEMemberTracking : EVEResult
@property (nonatomic, strong) NSArray *members;
@end