//
//  EVEIndustryJobs.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEIndustryJobsItem : NSObject {
	NSInteger jobID, assemblyLineID, installedItemQuantity,
		installedItemProductivityLevel, installedItemMaterialLevel, installedItemLicensedProductionRunsRemaining,
		runs, licensedProductionRuns, installedInSolarSystemID,
		containerLocationID, installedItemTypeID, outputTypeID, containerTypeID, installedItemCopy, completed,
		completedSuccessfully, installedItemFlag, outputFlag, activityID, completedStatus;
	long long installedItemID, containerID, installedItemLocationID, outputLocationID, installerID;
	
	float materialMultiplier,charMaterialMultiplier, timeMultiplier,charTimeMultiplier;
	
	NSDate *installTime, *beginProductionTime, *endProductionTime, *pauseProductionTime;
}
@property (nonatomic) NSInteger jobID, assemblyLineID, installedItemQuantity,
								installedItemProductivityLevel, installedItemMaterialLevel, installedItemLicensedProductionRunsRemaining,
								runs, licensedProductionRuns, installedInSolarSystemID,
								containerLocationID, installedItemTypeID, outputTypeID, containerTypeID, installedItemCopy, completed,
								completedSuccessfully, installedItemFlag, outputFlag, activityID, completedStatus;
@property (nonatomic) long long installedItemID, containerID, installedItemLocationID, outputLocationID, installerID;

@property (nonatomic) float materialMultiplier,charMaterialMultiplier, timeMultiplier,charTimeMultiplier;
@property (nonatomic, retain) NSDate *installTime, *beginProductionTime, *endProductionTime, *pauseProductionTime;

+ (id) industryJobsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEIndustryJobs : EVERequest {
	NSMutableArray *jobs;
}
@property (nonatomic, retain) NSArray *jobs;

+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;

@end
