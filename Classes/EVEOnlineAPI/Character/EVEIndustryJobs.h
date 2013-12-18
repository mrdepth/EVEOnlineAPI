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
@property (nonatomic) NSInteger jobID, assemblyLineID, installedItemQuantity,
								installedItemProductivityLevel, installedItemMaterialLevel, installedItemLicensedProductionRunsRemaining,
								runs, licensedProductionRuns, installedInSolarSystemID,
								containerLocationID, installedItemTypeID, outputTypeID, containerTypeID, installedItemCopy, completed,
								completedSuccessfully, installedItemFlag, outputFlag, activityID, completedStatus;
@property (nonatomic) long long installedItemID, containerID, installedItemLocationID, outputLocationID, installerID;

@property (nonatomic) float materialMultiplier,charMaterialMultiplier, timeMultiplier,charTimeMultiplier;
@property (nonatomic, strong) NSDate *installTime, *beginProductionTime, *endProductionTime, *pauseProductionTime;

+ (id) industryJobsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEIndustryJobs : EVERequest
@property (nonatomic, strong) NSArray *jobs;

+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
