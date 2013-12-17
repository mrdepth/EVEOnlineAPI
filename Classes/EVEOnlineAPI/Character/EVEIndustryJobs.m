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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.jobID forKey:@"jobID"];
	[aCoder encodeInteger:self.assemblyLineID forKey:@"assemblyLineID"];
	[aCoder encodeInteger:self.installedItemQuantity forKey:@"installedItemQuantity"];
	[aCoder encodeInteger:self.installedItemProductivityLevel forKey:@"installedItemProductivityLevel"];
	[aCoder encodeInteger:self.installedItemMaterialLevel forKey:@"installedItemMaterialLevel"];
	[aCoder encodeInteger:self.installedItemLicensedProductionRunsRemaining forKey:@"installedItemLicensedProductionRunsRemaining"];
	[aCoder encodeInteger:self.runs forKey:@"runs"];
	[aCoder encodeInteger:self.licensedProductionRuns forKey:@"licensedProductionRuns"];
	[aCoder encodeInteger:self.installedInSolarSystemID forKey:@"installedInSolarSystemID"];
	[aCoder encodeInteger:self.containerLocationID forKey:@"containerLocationID"];
	[aCoder encodeInteger:self.installedItemTypeID forKey:@"installedItemTypeID"];
	[aCoder encodeInteger:self.outputTypeID forKey:@"outputTypeID"];
	[aCoder encodeInteger:self.containerTypeID forKey:@"containerTypeID"];
	[aCoder encodeInteger:self.installedItemCopy forKey:@"installedItemCopy"];
	[aCoder encodeInteger:self.completed forKey:@"completed"];
	[aCoder encodeInteger:self.completedSuccessfully forKey:@"completedSuccessfully"];
	[aCoder encodeInteger:self.installedItemFlag forKey:@"installedItemFlag"];
	[aCoder encodeInteger:self.outputFlag forKey:@"outputFlag"];
	[aCoder encodeInteger:self.activityID forKey:@"activityID"];
	[aCoder encodeInteger:self.completedStatus forKey:@"completedStatus"];

	[aCoder encodeInt64:self.installedItemID forKey:@"installedItemID"];
	[aCoder encodeInt64:self.containerID forKey:@"containerID"];
	[aCoder encodeInt64:self.installedItemLocationID forKey:@"installedItemLocationID"];
	[aCoder encodeInt64:self.outputLocationID forKey:@"outputLocationID"];
	[aCoder encodeInt64:self.installerID forKey:@"installerID"];

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
		self.jobID = [aDecoder decodeIntegerForKey:@"jobID"];
		self.assemblyLineID = [aDecoder decodeIntegerForKey:@"assemblyLineID"];
		self.installedItemQuantity = [aDecoder decodeIntegerForKey:@"installedItemQuantity"];
		self.installedItemProductivityLevel = [aDecoder decodeIntegerForKey:@"installedItemProductivityLevel"];
		self.installedItemMaterialLevel = [aDecoder decodeIntegerForKey:@"installedItemMaterialLevel"];
		self.installedItemLicensedProductionRunsRemaining = [aDecoder decodeIntegerForKey:@"installedItemLicensedProductionRunsRemaining"];
		self.runs = [aDecoder decodeIntegerForKey:@"runs"];
		self.licensedProductionRuns = [aDecoder decodeIntegerForKey:@"licensedProductionRuns"];
		self.installedInSolarSystemID = [aDecoder decodeIntegerForKey:@"installedInSolarSystemID"];
		self.containerLocationID = [aDecoder decodeIntegerForKey:@"containerLocationID"];
		self.installedItemTypeID = [aDecoder decodeIntegerForKey:@"installedItemTypeID"];
		self.outputTypeID = [aDecoder decodeIntegerForKey:@"outputTypeID"];
		self.containerTypeID = [aDecoder decodeIntegerForKey:@"containerTypeID"];
		self.installedItemCopy = [aDecoder decodeIntegerForKey:@"installedItemCopy"];
		self.completed = [aDecoder decodeIntegerForKey:@"completed"];
		self.completedSuccessfully = [aDecoder decodeIntegerForKey:@"completedSuccessfully"];
		self.installedItemFlag = [aDecoder decodeIntegerForKey:@"installedItemFlag"];
		self.outputFlag = [aDecoder decodeIntegerForKey:@"outputFlag"];
		self.activityID = [aDecoder decodeIntegerForKey:@"activityID"];
		self.completedStatus = [aDecoder decodeIntegerForKey:@"completedStatus"];
		
		self.installedItemID = [aDecoder decodeInt64ForKey:@"installedItemID"];
		self.containerID = [aDecoder decodeInt64ForKey:@"containerID"];
		self.installedItemLocationID = [aDecoder decodeInt64ForKey:@"installedItemLocationID"];
		self.outputLocationID = [aDecoder decodeInt64ForKey:@"outputLocationID"];
		self.installerID = [aDecoder decodeInt64ForKey:@"installerID"];

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

+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEIndustryJobs alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/IndustryJobs.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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
