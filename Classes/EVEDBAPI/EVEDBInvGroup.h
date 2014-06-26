//
//  EVEDBInvGroup.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBInvCategory;
@class EVEDBEveIcon;
@interface EVEDBInvGroup : EVEDBObject

@property (nonatomic) int32_t groupID;
@property (nonatomic) int32_t categoryID;
@property (nonatomic, strong) EVEDBInvCategory *category;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) BOOL useBasePrice;
@property (nonatomic) BOOL allowManufacture;
@property (nonatomic) BOOL allowRecycler;
@property (nonatomic) BOOL anchored;
@property (nonatomic) BOOL anchorable;
@property (nonatomic) BOOL fittableNonSingleton;
@property (nonatomic) BOOL published;

+ (id) invGroupWithGroupID: (int32_t)aGroupID error:(NSError **)errorPtr;
- (id) initWithGroupID: (int32_t)aGroupID error:(NSError **)errorPtr;

@end
