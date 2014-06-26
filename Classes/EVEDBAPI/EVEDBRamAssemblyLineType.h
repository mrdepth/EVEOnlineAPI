//
//  EVEDBRamAssemblyLineType.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBRamActivity;
@interface EVEDBRamAssemblyLineType : EVEDBObject
@property (nonatomic) int32_t assemblyLineTypeID;
@property (nonatomic, strong) NSString* assemblyLineTypeName;
@property (nonatomic, strong) NSString* description;
@property (nonatomic) float baseTimeMultiplier;
@property (nonatomic) float baseMaterialMultiplier;
@property (nonatomic) float volume;
@property (nonatomic) int32_t activityID;
@property (nonatomic, strong) EVEDBRamActivity* activity;
@property (nonatomic) float minCostPerHour;

+ (id) ramAssemblyLineTypeWithAssemblyLineTypeID: (int32_t)aAssemblyLineTypeID error:(NSError **)errorPtr;
- (id) initWithAssemblyLineTypeID: (int32_t)aAssemblyLineTypeID error:(NSError **)errorPtr;

@end