//
//  EVEDBInvControlTowerResource.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBInvControlTowerResourcePurpose;
@class EVEDBInvType;
@interface EVEDBInvControlTowerResource : NSObject {
	NSInteger controlTowerTypeID;
	NSInteger resourceTypeID;
	EVEDBInvType *resourceType;
	NSInteger purposeID;
	EVEDBInvControlTowerResourcePurpose *purpose;
	NSInteger quantity;
	double minSecurityLevel;
	NSInteger factionID;
}
@property (nonatomic) NSInteger controlTowerTypeID;
@property (nonatomic) NSInteger resourceTypeID;
@property (nonatomic, retain) EVEDBInvType *resourceType;
@property (nonatomic) NSInteger purposeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, retain) EVEDBInvControlTowerResourcePurpose *purpose;
@property (nonatomic) double minSecurityLevel;
@property (nonatomic) NSInteger factionID;

+ (id) invControlTowerResourceWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
