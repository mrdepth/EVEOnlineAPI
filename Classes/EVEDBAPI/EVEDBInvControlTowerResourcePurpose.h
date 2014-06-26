//
//  EVEDBInvControlTowerResourcePurpose.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBInvControlTowerResourcePurpose : EVEDBObject
@property (nonatomic) int32_t purposeID;
@property (nonatomic, strong) NSString *purposeText;

+ (id) invControlTowerResourcePurposeWithPurposeID: (int32_t)aPurposeID error:(NSError **)errorPtr;
- (id) initWithPurposeID: (int32_t)aPurposeID error:(NSError **)errorPtr;

@end
