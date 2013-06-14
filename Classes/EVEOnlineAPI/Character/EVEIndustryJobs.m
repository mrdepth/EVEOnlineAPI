//
//  EVEIndustryJobs.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEIndustryJobs.h"

@implementation EVEIndustryJobsItem

+ (id) industryJobsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEIndustryJobsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.jobID = [[attributeDict valueForKey:@"jobID"] integerValue];
		self.assemblyLineID = [[attributeDict valueForKey:@"assemblyLineID"] integerValue];
		self.containerID = [[attributeDict valueForKey:@"containerID"] longLongValue];
		self.installedItemID = [[attributeDict valueForKey:@"installedItemID"] longLongValue];
		self.installedItemLocationID = [[attributeDict valueForKey:@"installedItemLocationID"] longLongValue];
		self.installedItemQuantity = [[attributeDict valueForKey:@"installedItemQuantity"] integerValue];
		self.installedItemProductivityLevel = [[attributeDict valueForKey:@"installedItemProductivityLevel"] integerValue];
		self.installedItemMaterialLevel = [[attributeDict valueForKey:@"installedItemMaterialLevel"] integerValue];
		self.installedItemLicensedProductionRunsRemaining = [[attributeDict valueForKey:@"installedItemLicensedProductionRunsRemaining"] integerValue];
		self.outputLocationID = [[attributeDict valueForKey:@"outputLocationID"] longLongValue];
		self.installerID = [[attributeDict valueForKey:@"installerID"] longLongValue];
		self.runs = [[attributeDict valueForKey:@"runs"] integerValue];
		self.licensedProductionRuns = [[attributeDict valueForKey:@"licensedProductionRuns"] integerValue];
		self.installedInSolarSystemID = [[attributeDict valueForKey:@"installedInSolarSystemID"] integerValue];
		self.containerLocationID = [[attributeDict valueForKey:@"containerLocationID"] integerValue];
		self.materialMultiplier = [[attributeDict valueForKey:@"materialMultiplier"] floatValue];
		self.charMaterialMultiplier = [[attributeDict valueForKey:@"charMaterialMultiplier"] floatValue];
		self.timeMultiplier = [[attributeDict valueForKey:@"timeMultiplier"] floatValue];
		self.charTimeMultiplier = [[attributeDict valueForKey:@"charTimeMultiplier"] floatValue];
		self.installedItemTypeID = [[attributeDict valueForKey:@"installedItemTypeID"] integerValue];
		self.outputTypeID = [[attributeDict valueForKey:@"outputTypeID"] integerValue];
		self.containerTypeID = [[attributeDict valueForKey:@"containerTypeID"] integerValue];
		self.installedItemCopy = [[attributeDict valueForKey:@"installedItemCopy"] integerValue];
		self.completed = [[attributeDict valueForKey:@"completed"] integerValue];
		self.completedSuccessfully = [[attributeDict valueForKey:@"completedSuccessfully"] integerValue];
		self.installedItemFlag = [[attributeDict valueForKey:@"installedItemFlag"] integerValue];
		self.outputFlag = [[attributeDict valueForKey:@"outputFlag"] integerValue];
		self.activityID = [[attributeDict valueForKey:@"activityID"] integerValue];
		self.completedStatus = [[attributeDict valueForKey:@"completedStatus"] integerValue];
		self.installTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"installTime"]];
		self.beginProductionTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"beginProductionTime"]];
		self.endProductionTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"endProductionTime"]];
		self.pauseProductionTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"pauseProductionTime"]];
	}
	return self;
}

@end

@implementation EVEIndustryJobs

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEIndustryJobs alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/IndustryJobs.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"jobs"])
		return self.jobs = [[NSMutableArray alloc] init];
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"jobs"]) {
		EVEIndustryJobsItem *job = [EVEIndustryJobsItem industryJobsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*)self.jobs addObject:job];
		return job;
	}
	return nil;
}
@end
