//
//  EVEDBCrtCategory.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVEDBCrtCategory : NSObject {
	NSInteger categoryID;
	NSString *description;
	NSString *categoryName;
}
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *categoryName;

+ (id) crtCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
+ (id) crtCategoryWithDictionary: (NSDictionary*) dictionary;
- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end