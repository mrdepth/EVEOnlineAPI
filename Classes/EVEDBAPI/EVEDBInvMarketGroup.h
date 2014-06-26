//
//  EVEDBInvMarketGroup.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBEveIcon;
@interface EVEDBInvMarketGroup : EVEDBObject
@property (nonatomic) int32_t marketGroupID;
@property (nonatomic) int32_t parentGroupID;
@property (nonatomic, strong) EVEDBInvMarketGroup *parentGroup;
@property (nonatomic, strong) NSString *marketGroupName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) BOOL hasTypes;

+ (id) invMarketGroupWithMarketGroupID: (int32_t)aMarketGroupID error:(NSError **)errorPtr;
- (id) initWithMarketGroupID: (int32_t)aMarketGroupID error:(NSError **)errorPtr;
@end
