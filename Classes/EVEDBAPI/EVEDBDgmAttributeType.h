//
//  EVEDBDgmAttributeType.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBEveIcon;
@class EVEDBEveUnit;
@class EVEDBDgmAttributeCategory;
@interface EVEDBDgmAttributeType : EVEDBObject
@property (nonatomic) NSInteger attributeID;
@property (nonatomic, strong) NSString *attributeName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) float defaultValue;
@property (nonatomic) BOOL published;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic) NSInteger unitID;
@property (nonatomic, strong) EVEDBEveUnit *unit;
@property (nonatomic) BOOL stackable;
@property (nonatomic) BOOL highIsGood;
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, strong) EVEDBDgmAttributeCategory *category;

+ (id) dgmAttributeTypeWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr;
- (id) initWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr;

@end
