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
@property (nonatomic) int32_t attributeID;
@property (nonatomic, strong) NSString *attributeName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic) float defaultValue;
@property (nonatomic) BOOL published;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic) int32_t unitID;
@property (nonatomic, strong) EVEDBEveUnit *unit;
@property (nonatomic) BOOL stackable;
@property (nonatomic) BOOL highIsGood;
@property (nonatomic) int32_t categoryID;
@property (nonatomic, strong) EVEDBDgmAttributeCategory *category;

+ (id) dgmAttributeTypeWithAttributeTypeID: (int32_t)aAttributeTypeID error:(NSError **)errorPtr;
- (id) initWithAttributeTypeID: (int32_t)aAttributeTypeID error:(NSError **)errorPtr;

@end
