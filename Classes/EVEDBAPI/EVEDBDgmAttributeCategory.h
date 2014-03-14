//
//  EVEDBDgmAttributeCategory.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBDgmAttributeCategory : EVEDBObject
@property (nonatomic) int32_t categoryID;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *description;

+ (id) dgmAttributeCategoryWithAttributeCategoryID: (int32_t)aAttributeCategoryID error:(NSError **)errorPtr;
- (id) initWithAttributeCategoryID: (int32_t)aAttributeCategoryID error:(NSError **)errorPtr;

@end
