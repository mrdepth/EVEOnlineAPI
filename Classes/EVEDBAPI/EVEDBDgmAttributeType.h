//
//  EVEDBDgmAttributeType.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBEveIcon;
@class EVEDBEveUnit;
@class EVEDBDgmAttributeCategory;
@interface EVEDBDgmAttributeType : NSObject {
	NSInteger attributeID;
	NSString *attributeName;
	NSString *description;
	NSInteger iconID;
	EVEDBEveIcon *icon;
	float defaultValue;
	BOOL published;
	NSString *displayName;
	NSInteger unitID;
	EVEDBEveUnit *unit;
	BOOL stackable;
	BOOL highIsGood;
	NSInteger categoryID;
	EVEDBDgmAttributeCategory *category;
}
@property (nonatomic) NSInteger attributeID;
@property (nonatomic, retain) NSString *attributeName;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, retain) EVEDBEveIcon *icon;
@property (nonatomic) float defaultValue;
@property (nonatomic) BOOL published;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic) NSInteger unitID;
@property (nonatomic, retain) EVEDBEveUnit *unit;
@property (nonatomic) BOOL stackable;
@property (nonatomic) BOOL highIsGood;
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, retain) EVEDBDgmAttributeCategory *category;

+ (id) dgmAttributeTypeWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr;
+ (id) dgmAttributeTypeWithDictionary: (NSDictionary*) dictionary;
- (id) initWithAttributeTypeID: (NSInteger)aAttributeTypeID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
