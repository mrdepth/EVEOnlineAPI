//
//  EVEDBRamAssemblyLineType.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBRamActivity;
@interface EVEDBRamAssemblyLineType : NSObject {
	NSInteger assemblyLineTypeID;
	NSString* assemblyLineTypeName;
	NSString* description;
	float baseTimeMultiplier;
	float baseMaterialMultiplier;
	float volume;
	NSInteger activityID;
	EVEDBRamActivity* activity;
	float minCostPerHour;
}
@property (nonatomic) NSInteger assemblyLineTypeID;
@property (nonatomic, retain) NSString* assemblyLineTypeName;
@property (nonatomic, retain) NSString* description;
@property (nonatomic) float baseTimeMultiplier;
@property (nonatomic) float baseMaterialMultiplier;
@property (nonatomic) float volume;
@property (nonatomic) NSInteger activityID;
@property (nonatomic, retain) EVEDBRamActivity* activity;
@property (nonatomic) float minCostPerHour;

+ (id) ramAssemblyLineTypeWithAssemblyLineTypeID: (NSInteger)aAssemblyLineTypeID error:(NSError **)errorPtr;
+ (id) ramAssemblyLineTypeWithDictionary: (NSDictionary*) dictionary;
- (id) initWithAssemblyLineTypeID: (NSInteger)aAssemblyLineTypeID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end