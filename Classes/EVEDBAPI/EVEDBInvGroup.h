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

@property (nonatomic) NSInteger groupID;
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, strong) EVEDBInvCategory *category;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) BOOL useBasePrice;
@property (nonatomic) BOOL allowManufacture;
@property (nonatomic) BOOL allowRecycler;
@property (nonatomic) BOOL anchored;
@property (nonatomic) BOOL anchorable;
@property (nonatomic) BOOL fittableNonSingleton;
@property (nonatomic) BOOL published;

+ (id) invGroupWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr;
- (id) initWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr;

@end
