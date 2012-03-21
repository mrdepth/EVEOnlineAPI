//
//  EVEIndustryJobs.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEIndustryJobs.h"

@implementation EVEIndustryJobsItem
@synthesize jobID, assemblyLineID, containerID, installedItemID, installedItemLocationID, installedItemQuantity,
			installedItemProductivityLevel, installedItemMaterialLevel, installedItemLicensedProductionRunsRemaining,
			outputLocationID, installerID, runs, licensedProductionRuns, installedInSolarSystemID,
			containerLocationID, installedItemTypeID, outputTypeID, containerTypeID, installedItemCopy, completed,
			completedSuccessfully, installedItemFlag, outputFlag, activityID, completedStatus,
			materialMultiplier,charMaterialMultiplier, timeMultiplier,charTimeMultiplier,
			installTime, beginProductionTime, endProductionTime, pauseProductionTime;



+ (id) industryJobsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEIndustryJobsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[installTime release];
	[beginProductionTime release];
	[endProductionTime release];
	[pauseProductionTime release];
	[super dealloc];
}
@end


@implementation EVEIndustryJobs
@synthesize jobs;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEIndustryJobs alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) industryJobsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEIndustryJobs alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/IndustryJobs.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/IndustryJobs.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[jobs release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"jobs"])
		return jobs = [[NSMutableArray alloc] init];
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"jobs"]) {
		EVEIndustryJobsItem *job = [EVEIndustryJobsItem industryJobsItemWithXMLAttributes:attributeDict];
		[jobs addObject:job];
		return job;
	}
	return nil;
}
@end
