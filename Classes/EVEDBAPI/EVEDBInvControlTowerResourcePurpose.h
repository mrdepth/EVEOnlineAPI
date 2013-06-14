//
//  EVEDBInvControlTowerResourcePurpose.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBInvControlTowerResourcePurpose : EVEDBObject
@property (nonatomic) NSInteger purposeID;
@property (nonatomic, strong) NSString *purposeText;

+ (id) invControlTowerResourcePurposeWithPurposeID: (NSInteger)aPurposeID error:(NSError **)errorPtr;
- (id) initWithPurposeID: (NSInteger)aPurposeID error:(NSError **)errorPtr;

@end
