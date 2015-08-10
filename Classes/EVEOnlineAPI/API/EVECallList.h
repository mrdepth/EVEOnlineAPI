//
//  EVECallList.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"
#import "EVEGlobals.h"

@interface EVECallListCallGroupsItem : EVEObject
@property (nonatomic) int32_t groupID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *callGroupDescription;
@end

@interface EVECallListCallsItem : EVEObject
@property (nonatomic) int32_t accessMask;
@property (nonatomic) EVECallType type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) int32_t groupID;
@property (nonatomic, strong) NSString *callDescription;
@end



@interface EVECallList : EVEResult
@property (nonatomic, strong) NSArray *callGroups;
@property (nonatomic, strong) NSArray *calls;
@end