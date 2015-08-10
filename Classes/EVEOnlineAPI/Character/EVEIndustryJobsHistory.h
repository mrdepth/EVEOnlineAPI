//
//  EVEIndustryJobsHistory.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEResult.h"
#import "EVEIndustryJobs.h"

@interface EVEIndustryJobsHistory : EVEResult
@property (nonatomic, strong) NSArray *jobs;

@end
