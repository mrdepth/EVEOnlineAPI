//
//  EVEIndustryJobs.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEIndustryJobsItem : NSObject<NSCoding>
@property (nonatomic) int64_t installedItemID, containerID;
@property (nonatomic) int32_t installedItemLocationID, outputLocationID, installerID;
@property (nonatomic) int32_t jobID, assemblyLineID, installedItemQuantity,
								installedItemProductivityLevel, installedItemMaterialLevel, installedItemLicensedProductionRunsRemaining,
								runs, licensedProductionRuns, installedInSolarSystemID,
								containerLocationID, installedItemTypeID, outputTypeID, containerTypeID, installedItemCopy, completed,
								completedSuccessfully, installedItemFlag, outputFlag, activityID, completedStatus;

@property (nonatomic) float materialMultiplier,charMaterialMultiplier, timeMultiplier,charTimeMultiplier;
@property (nonatomic, strong) NSDate *installTime, *beginProductionTime, *endProductionTime, *pauseProductionTime;

+ (id) industryJobsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEIndustryJobs : EVERequest
@property (nonatomic, strong) NSArray *jobs;

+ (id) industryJobsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
