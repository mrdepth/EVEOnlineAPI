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
@property (nonatomic) NSInteger assemblyLineTypeID;
@property (nonatomic, strong) NSString* assemblyLineTypeName;
@property (nonatomic, strong) NSString* description;
@property (nonatomic) float baseTimeMultiplier;
@property (nonatomic) float baseMaterialMultiplier;
@property (nonatomic) float volume;
@property (nonatomic) NSInteger activityID;
@property (nonatomic, strong) EVEDBRamActivity* activity;
@property (nonatomic) float minCostPerHour;

+ (id) ramAssemblyLineTypeWithAssemblyLineTypeID: (NSInteger)aAssemblyLineTypeID error:(NSError **)errorPtr;
- (id) initWithAssemblyLineTypeID: (NSInteger)aAssemblyLineTypeID error:(NSError **)errorPtr;

@end