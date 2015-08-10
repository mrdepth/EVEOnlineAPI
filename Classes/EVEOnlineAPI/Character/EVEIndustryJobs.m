//
//  EVEIndustryJobs.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEIndustryJobs.h"

@implementation EVEIndustryJobsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"runs":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"licensedRuns":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"status":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"productTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"activityID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"blueprintTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"timeInSeconds":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"facilityID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"teamID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"successfulRuns":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"jobID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"installerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"blueprintID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"outputLocationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"blueprintLocationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"completedCharacterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"cost":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"probability":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},

				   @"startDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"endDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"pauseDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"completedDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   
				   @"installerName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"blueprintTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"productTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	
	return scheme;
}

@end

@implementation EVEIndustryJobs

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"jobs":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEIndustryJobsItem class]}};
	
	return scheme;
}

@end
