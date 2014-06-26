//
//  EVEDBRamActivity.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBRamActivity : EVEDBObject
@property (nonatomic) int32_t activityID;
@property (nonatomic, strong) NSString *activityName;
@property (nonatomic, strong) NSString *iconNo;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) BOOL published;
@property(nonatomic, strong, readonly) NSString *iconImageName;

+ (id) ramActivityWithActivityID: (int32_t)aActivityID error:(NSError **)errorPtr;
- (id) initWithActivityID: (int32_t)aActivityID error:(NSError **)errorPtr;

@end