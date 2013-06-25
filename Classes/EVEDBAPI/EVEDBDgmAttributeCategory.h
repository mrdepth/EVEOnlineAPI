//
//  EVEDBDgmAttributeCategory.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBDgmAttributeCategory : EVEDBObject
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *description;

+ (id) dgmAttributeCategoryWithAttributeCategoryID: (NSInteger)aAttributeCategoryID error:(NSError **)errorPtr;
- (id) initWithAttributeCategoryID: (NSInteger)aAttributeCategoryID error:(NSError **)errorPtr;

@end
