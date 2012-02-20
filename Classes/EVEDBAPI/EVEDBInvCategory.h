//
//  EVEDBInvCategory.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBEveIcon;
@interface EVEDBInvCategory : NSObject {
	NSInteger categoryID;
	NSString *categoryName;
	NSString *description;
	NSInteger iconID;
	EVEDBEveIcon *icon;
	BOOL published;
}
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, retain) NSString *categoryName;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, retain) EVEDBEveIcon *icon;
@property (nonatomic) BOOL published;

+ (id) invCategoryWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
+ (id) invCategoryWithDictionary: (NSDictionary*) dictionary;
- (id) initWithCategoryID: (NSInteger)aCategoryID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;
@end
