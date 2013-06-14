//
//  EVEDBCrtCategory.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@interface EVEDBCrtCategory : EVEDBObject
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *categoryName;

+ (id) crtCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;

@end