//
//  EVEDBInvCategory.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBEveIcon;
@interface EVEDBInvCategory : EVEDBObject
@property (nonatomic) int32_t categoryID;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) BOOL published;

+ (id) invCategoryWithCategoryID: (int32_t)aCategoryID error:(NSError **)errorPtr;
- (id) initWithCategoryID: (int32_t)aCategoryID error:(NSError **)errorPtr;
@end
