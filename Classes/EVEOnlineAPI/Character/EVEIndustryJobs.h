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

@property (nonatomic) int32_t runs, licensedRuns, stationID,
  productTypeName, status, blueprintLocationID, productTypeID, activityID, blueprintTypeID;

@property (nonatomic) int64_t jobID, installerID,
  facilityID, solarSystemID,
  blueprintID, outputLocationID,
  teamID, timeInSeconds, completedCharacterID;

/* probability's type not shown in documentation, we assume it as float */
@property (nonatomic) float cost, probability;
@property (nonatomic, strong) NSDate *startDate, *endDate, *pauseDate, *completedDate;
@property (nonatomic, strong) NSString *installerName, *solarSystemName, *blueprintTypeName;

+ (id) industryJobsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEIndustryJobs : EVERequest
@property (nonatomic, strong) NSArray *jobs;

+ (id) industryJobsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
