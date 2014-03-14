//
//  EVEDBCrtCategory.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@interface EVEDBCrtCategory : EVEDBObject
@property (nonatomic) int32_t categoryID;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *categoryName;

+ (id) crtCategoryWithCategoryID: (int32_t)aCategoryID error:(NSError **)errorPtr;
- (id) initWithCategoryID: (int32_t)aCategoryID error:(NSError **)errorPtr;

@end