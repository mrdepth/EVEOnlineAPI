//
//  EVEDBInvGroup.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBInvCategory;
@class EVEDBEveIcon;
@interface EVEDBInvGroup : NSObject {
	NSInteger groupID;
	NSInteger categoryID;
	EVEDBInvCategory *category;
	NSString *groupName;
	NSString *description;
	NSInteger iconID;
	EVEDBEveIcon *icon;
	BOOL useBasePrice;
	BOOL allowManufacture;
	BOOL allowRecycler;
	BOOL anchored;
	BOOL anchorable;
	BOOL fittableNonSingleton;
	BOOL published;
}

@property (nonatomic) NSInteger groupID;
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, retain) EVEDBInvCategory *category;
@property (nonatomic, retain) NSString *groupName;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, retain) EVEDBEveIcon *icon;
@property (nonatomic) BOOL useBasePrice;
@property (nonatomic) BOOL allowManufacture;
@property (nonatomic) BOOL allowRecycler;
@property (nonatomic) BOOL anchored;
@property (nonatomic) BOOL anchorable;
@property (nonatomic) BOOL fittableNonSingleton;
@property (nonatomic) BOOL published;

+ (id) invGroupWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr;
+ (id) invGroupWithDictionary: (NSDictionary*) dictionary;
- (id) initWithGroupID: (NSInteger)aGroupID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
