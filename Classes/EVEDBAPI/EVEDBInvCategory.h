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
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) BOOL published;

+ (id) invCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
@end
