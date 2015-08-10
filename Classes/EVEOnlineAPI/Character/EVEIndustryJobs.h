//
//  EVEIndustryJobs.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"
#import "EVEGlobals.h"

@interface EVEIndustryJobsItem : EVEObject

@property (nonatomic) int32_t runs, licensedRuns, stationID, productTypeID, activityID, blueprintTypeID, timeInSeconds,
  facilityID, solarSystemID, teamID, successfulRuns;

@property (nonatomic) int64_t jobID, installerID,
  blueprintID, outputLocationID, blueprintLocationID,
  completedCharacterID;

@property (nonatomic) float cost, probability;
@property (nonatomic, strong) NSDate *startDate, *endDate, *pauseDate, *completedDate;
@property (nonatomic, strong) NSString *installerName, *solarSystemName, *blueprintTypeName, *productTypeName;
@property (nonatomic) EVEIndustryJobStatus status;

@end


@interface EVEIndustryJobs : EVEResult
@property (nonatomic, strong) NSArray *jobs;

@end