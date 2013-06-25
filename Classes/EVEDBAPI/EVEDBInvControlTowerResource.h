//
//  EVEDBInvControlTowerResource.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBInvControlTowerResourcePurpose;
@class EVEDBInvType;
@interface EVEDBInvControlTowerResource : EVEDBObject
@property (nonatomic) NSInteger controlTowerTypeID;
@property (nonatomic) NSInteger resourceTypeID;
@property (nonatomic, strong) EVEDBInvType *resourceType;
@property (nonatomic) NSInteger purposeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, strong) EVEDBInvControlTowerResourcePurpose *purpose;
@property (nonatomic) double minSecurityLevel;
@property (nonatomic) NSInteger factionID;

@end
