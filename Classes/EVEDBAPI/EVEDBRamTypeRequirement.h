//
//  EVEDBRamTypeRequirement.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import <Foundation/Foundation.h>

@class EVEDBInvType;
@class EVEDBRamActivity;
@interface EVEDBRamTypeRequirement : NSObject {
	NSInteger typeID;
	EVEDBInvType* type;
	NSInteger activityID;
	EVEDBRamActivity* activity;
	NSInteger requiredTypeID;
	EVEDBInvType* requiredType;
	NSInteger quantity;
	float damagePerJob;
	NSInteger recycle;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) EVEDBInvType* type;
@property (nonatomic) NSInteger activityID;
@property (nonatomic, retain) EVEDBRamActivity* activity;
@property (nonatomic) NSInteger requiredTypeID;
@property (nonatomic, retain) EVEDBInvType* requiredType;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) float damagePerJob;
@property (nonatomic) NSInteger recycle;

+ (id) ramTypeRequirementWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end