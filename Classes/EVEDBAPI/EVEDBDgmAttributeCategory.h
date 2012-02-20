//
//  EVEDBDgmAttributeCategory.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBDgmAttributeCategory : NSObject {
	NSInteger categoryID;
	NSString *categoryName;
	NSString *categoryDescription;
}
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, retain) NSString *categoryName;
@property (nonatomic, retain) NSString *categoryDescription;

+ (id) dgmAttributeCategoryWithAttributeCategoryID: (NSInteger)aAttributeCategoryID error:(NSError **)errorPtr;
+ (id) dgmAttributeCategoryWithDictionary: (NSDictionary*) dictionary;
- (id) initWithAttributeCategoryID: (NSInteger)aAttributeCategoryID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
