//
//  EVEDBInvType.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEDBDgmAttributeCategory.h"

@interface EVEDBInvTypeAttributeCategory: EVEDBDgmAttributeCategory {
	NSMutableArray *publishedAttributes;
	NSMutableArray *unpublishedAttributes;
}
@property (nonatomic, retain) NSMutableArray *publishedAttributes;
@property (nonatomic, retain) NSMutableArray *unpublishedAttributes;
@end

@class EVEDBInvGroup;
@class EVEDBInvMarketGroup;
@class EVEDBEveIcon;
@interface EVEDBInvType : NSObject {
	NSInteger typeID;
	NSInteger groupID;
	EVEDBInvGroup *group;
	NSString *typeName;
	NSString *description;
	NSInteger graphicID;
	float radius;
	float mass;
	float volume;
	float capacity;
	NSInteger portionSize;
	NSInteger raceID;
	float basePrice;
	BOOL published;
	NSInteger marketGroupID;
	EVEDBInvMarketGroup *marketGroup;
	float chanceOfDuplicating;
	NSInteger iconID;
	EVEDBEveIcon *icon;
	NSString *imageName;
	NSMutableArray *attributeCategories;
	NSMutableDictionary *attributesDictionary;
	NSMutableDictionary *effectsDictionary;
	NSMutableArray *certificateRecommendations;
	NSMutableArray *requiredSkills;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger groupID;
@property (nonatomic, retain) EVEDBInvGroup *group;
@property (nonatomic, retain) NSString *typeName;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) NSInteger graphicID;
@property (nonatomic) float radius;
@property (nonatomic) float mass;
@property (nonatomic) float volume;
@property (nonatomic) float capacity;
@property (nonatomic) NSInteger portionSize;
@property (nonatomic) NSInteger raceID;
@property (nonatomic) float basePrice;
@property (nonatomic) BOOL published;
@property (nonatomic) NSInteger marketGroupID;
@property (nonatomic, retain) EVEDBInvMarketGroup *marketGroup;
@property (nonatomic) float chanceOfDuplicating;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, retain) EVEDBEveIcon *icon;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSMutableArray *attributeCategories;
@property (nonatomic, retain) NSMutableDictionary *attributesDictionary;
@property (nonatomic, retain) NSMutableDictionary *effectsDictionary;
@property (nonatomic, retain) NSMutableArray *certificateRecommendations;
@property (nonatomic, retain) NSMutableArray *requiredSkills;

+ (id) invTypeWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr;
+ (id) invTypeWithDictionary: (NSDictionary*) dictionary;
+ (id) invTypeWithInvType:(EVEDBInvType*) type;
- (id) initWithTypeID: (NSInteger)aTypeID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;
- (id) initWithInvType:(EVEDBInvType*) type;
- (NSString*) typeLargeImageName;
- (NSString*) typeSmallImageName;

@end

@interface EVEDBInvTypeRequiredSkill : EVEDBInvType {
	NSInteger requiredLevel;
	float requiredSP;
}
@property (nonatomic, assign) NSInteger requiredLevel;
@property (nonatomic, readonly) float requiredSP;
@end
