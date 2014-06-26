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
		self.jobID = [[attributeDict valueForKey:@"jobID"] intValue];
		self.assemblyLineID = [[attributeDict valueForKey:@"assemblyLineID"] intValue];
		self.containerID = [[attributeDict valueForKey:@"containerID"] longLongValue];
		self.installedItemID = [[attributeDict valueForKey:@"installedItemID"] longLongValue];
		self.installedItemLocationID = [[attributeDict valueForKey:@"installedItemLocationID"] intValue];
		self.installedItemQuantity = [[attributeDict valueForKey:@"installedItemQuantity"] intValue];
		self.installedItemProductivityLevel = [[attributeDict valueForKey:@"installedItemProductivityLevel"] intValue];
		self.installedItemMaterialLevel = [[attributeDict valueForKey:@"installedItemMaterialLevel"] intValue];
		self.installedItemLicensedProductionRunsRemaining = [[attributeDict valueForKey:@"installedItemLicensedProductionRunsRemaining"] intValue];
		self.outputLocationID = [[attributeDict valueForKey:@"outputLocationID"] intValue];
		self.installerID = [[attributeDict valueForKey:@"installerID"] intValue];
		self.runs = [[attributeDict valueForKey:@"runs"] intValue];
		self.licensedProductionRuns = [[attributeDict valueForKey:@"licensedProductionRuns"] intValue];
		self.installedInSolarSystemID = [[attributeDict valueForKey:@"installedInSolarSystemID"] intValue];
		self.containerLocationID = [[attributeDict valueForKey:@"containerLocationID"] intValue];
		self.materialMultiplier = [[attributeDict valueForKey:@"materialMultiplier"] floatValue];
		self.charMaterialMultiplier = [[attributeDict valueForKey:@"charMaterialMultiplier"] floatValue];
		self.timeMultiplier = [[attributeDict valueForKey:@"timeMultiplier"] floatValue];
		self.charTimeMultiplier = [[attributeDict valueForKey:@"charTimeMultiplier"] floatValue];
		self.installedItemTypeID = [[attributeDict valueForKey:@"installedItemTypeID"] intValue];
		self.outputTypeID = [[attributeDict valueForKey:@"outputTypeID"] intValue];
		self.containerTypeID = [[attributeDict valueForKey:@"containerTypeID"] intValue];
		self.installedItemCopy = [[attributeDict valueForKey:@"installedItemCopy"] intValue];
		self.completed = [[attributeDict valueForKey:@"completed"] intValue];
		self.completedSuccessfully = [[attributeDict valueForKey:@"completedSuccessfully"] intValue];
		self.installedItemFlag = [[attributeDict valueForKey:@"installedItemFlag"] intValue];
		self.outputFlag = [[attributeDict valueForKey:@"outputFlag"] intValue];
		self.activityID = [[attributeDict valueForKey:@"activityID"] intValue];
		self.completedStatus = [[attributeDict valueForKey:@"completedStatus"] intValue];
		self.installTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"installTime"]];
		self.beginProductionTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"beginProductionTime"]];
		self.endProductionTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"endProductionTime"]];
		self.pauseProductionTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"pauseProductionTime"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.jobID forKey:@"jobID"];
	[aCoder encodeInt32:self.assemblyLineID forKey:@"assemblyLineID"];
	[aCoder encodeInt32:self.installedItemQuantity forKey:@"installedItemQuantity"];
	[aCoder encodeInt32:self.installedItemProductivityLevel forKey:@"installedItemProductivityLevel"];
	[aCoder encodeInt32:self.installedItemMaterialLevel forKey:@"installedItemMaterialLevel"];
	[aCoder encodeInt32:self.installedItemLicensedProductionRunsRemaining forKey:@"installedItemLicensedProductionRunsRemaining"];
	[aCoder encodeInt32:self.runs forKey:@"runs"];
	[aCoder encodeInt32:self.licensedProductionRuns forKey:@"licensedProductionRuns"];
	[aCoder encodeInt32:self.installedInSolarSystemID forKey:@"installedInSolarSystemID"];
	[aCoder encodeInt32:self.containerLocationID forKey:@"containerLocationID"];
	[aCoder encodeInt32:self.installedItemTypeID forKey:@"installedItemTypeID"];
	[aCoder encodeInt32:self.outputTypeID forKey:@"outputTypeID"];
	[aCoder encodeInt32:self.containerTypeID forKey:@"containerTypeID"];
	[aCoder encodeInt32:self.installedItemCopy forKey:@"installedItemCopy"];
	[aCoder encodeInt32:self.completed forKey:@"completed"];
	[aCoder encodeInt32:self.completedSuccessfully forKey:@"completedSuccessfully"];
	[aCoder encodeInt32:self.installedItemFlag forKey:@"installedItemFlag"];
	[aCoder encodeInt32:self.outputFlag forKey:@"outputFlag"];
	[aCoder encodeInt32:self.activityID forKey:@"activityID"];
	[aCoder encodeInt32:self.completedStatus forKey:@"completedStatus"];

	[aCoder encodeInt64:self.installedItemID forKey:@"installedItemID"];
	[aCoder encodeInt64:self.containerID forKey:@"containerID"];
	[aCoder encodeInt32:self.installedItemLocationID forKey:@"installedItemLocationID"];
	[aCoder encodeInt32:self.outputLocationID forKey:@"outputLocationID"];
	[aCoder encodeInt32:self.installerID forKey:@"installerID"];

	[aCoder encodeFloat:self.materialMultiplier forKey:@"materialMultiplier"];
	[aCoder encodeFloat:self.charMaterialMultiplier forKey:@"charMaterialMultiplier"];
	[aCoder encodeFloat:self.timeMultiplier forKey:@"timeMultiplier"];
	[aCoder encodeFloat:self.charTimeMultiplier forKey:@"charTimeMultiplier"];
	
	[aCoder encodeObject:self.installTime forKey:@"installTime"];
	[aCoder encodeObject:self.beginProductionTime forKey:@"beginProductionTime"];
	[aCoder encodeObject:self.endProductionTime forKey:@"endProductionTime"];
	[aCoder encodeObject:self.pauseProductionTime forKey:@"pauseProductionTime"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.jobID = [aDecoder decodeInt32ForKey:@"jobID"];
		self.assemblyLineID = [aDecoder decodeInt32ForKey:@"assemblyLineID"];
		self.installedItemQuantity = [aDecoder decodeInt32ForKey:@"installedItemQuantity"];
		self.installedItemProductivityLevel = [aDecoder decodeInt32ForKey:@"installedItemProductivityLevel"];
		self.installedItemMaterialLevel = [aDecoder decodeInt32ForKey:@"installedItemMaterialLevel"];
		self.installedItemLicensedProductionRunsRemaining = [aDecoder decodeInt32ForKey:@"installedItemLicensedProductionRunsRemaining"];
		self.runs = [aDecoder decodeInt32ForKey:@"runs"];
		self.licensedProductionRuns = [aDecoder decodeInt32ForKey:@"licensedProductionRuns"];
		self.installedInSolarSystemID = [aDecoder decodeInt32ForKey:@"installedInSolarSystemID"];
		self.containerLocationID = [aDecoder decodeInt32ForKey:@"containerLocationID"];
		self.installedItemTypeID = [aDecoder decodeInt32ForKey:@"installedItemTypeID"];
		self.outputTypeID = [aDecoder decodeInt32ForKey:@"outputTypeID"];
		self.containerTypeID = [aDecoder decodeInt32ForKey:@"containerTypeID"];
		self.installedItemCopy = [aDecoder decodeInt32ForKey:@"installedItemCopy"];
		self.completed = [aDecoder decodeInt32ForKey:@"completed"];
		self.completedSuccessfully = [aDecoder decodeInt32ForKey:@"completedSuccessfully"];
		self.installedItemFlag = [aDecoder decodeInt32ForKey:@"installedItemFlag"];
		self.outputFlag = [aDecoder decodeInt32ForKey:@"outputFlag"];
		self.activityID = [aDecoder decodeInt32ForKey:@"activityID"];
		self.completedStatus = [aDecoder decodeInt32ForKey:@"completedStatus"];
		
		self.installedItemID = [aDecoder decodeInt64ForKey:@"installedItemID"];
		self.containerID = [aDecoder decodeInt64ForKey:@"containerID"];
		self.installedItemLocationID = [aDecoder decodeInt32ForKey:@"installedItemLocationID"];
		self.outputLocationID = [aDecoder decodeInt32ForKey:@"outputLocationID"];
		self.installerID = [aDecoder decodeInt32ForKey:@"installerID"];

		self.materialMultiplier = [aDecoder decodeFloatForKey:@"materialMultiplier"];
		self.charMaterialMultiplier = [aDecoder decodeFloatForKey:@"charMaterialMultiplier"];
		self.timeMultiplier = [aDecoder decodeFloatForKey:@"timeMultiplier"];
		self.charTimeMultiplier = [aDecoder decodeFloatForKey:@"charTimeMultiplier"];
		
		self.installTime = [aDecoder decodeObjectForKey:@"installTime"];
		self.beginProductionTime = [aDecoder decodeObjectForKey:@"beginProductionTime"];
		self.endProductionTime = [aDecoder decodeObjectForKey:@"endProductionTime"];
		self.pauseProductionTime = [aDecoder decodeObjectForKey:@"pauseProductionTime"];
	}
	return self;
}

@end

@implementation EVEIndustryJobs

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) industryJobsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEIndustryJobs alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/IndustryJobs.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.jobs forKey:@"jobs"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.jobs = [aDecoder decodeObjectForKey:@"jobs"];
	}
	return self;
}

@end
