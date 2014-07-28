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
		self.jobID = [[attributeDict valueForKey:@"jobID"] longLongValue];
		self.installerID = [[attributeDict valueForKey:@"installerID"] longLongValue];
		self.facilityID = [[attributeDict valueForKey:@"facilityID"] intValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] intValue];
		self.stationID = [[attributeDict valueForKey:@"stationID"] intValue];
		self.activityID = [[attributeDict valueForKey:@"activityID"] intValue];
		self.blueprintID = [[attributeDict valueForKey:@"blueprintID"] longLongValue];
		self.blueprintTypeID = [[attributeDict valueForKey:@"blueprintTypeID"] intValue];
		self.blueprintLocationID = [[attributeDict valueForKey:@"blueprintLocationID"] longLongValue];
		self.outputLocationID = [[attributeDict valueForKey:@"outputLocationID"] longLongValue];
		self.installerID = [[attributeDict valueForKey:@"installerID"] intValue];
		self.runs = [[attributeDict valueForKey:@"runs"] intValue];
		self.teamID = [[attributeDict valueForKey:@"teamID"] intValue];
		self.licensedRuns = [[attributeDict valueForKey:@"licensedRuns"] intValue];
		self.productTypeID = [[attributeDict valueForKey:@"productTypeID"] intValue];
		self.productTypeName = [[attributeDict valueForKey:@"productTypeName"] intValue];
		self.status = [[attributeDict valueForKey:@"status"] intValue];
		self.timeInSeconds = [[attributeDict valueForKey:@"timeInSeconds"] intValue];
		self.completedCharacterID = [[attributeDict valueForKey:@"completedCharacterID"] longLongValue];
		self.cost = [[attributeDict valueForKey:@"cost"] floatValue];
		self.probability = [[attributeDict valueForKey:@"probability"] floatValue];
		self.startDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startDate"]];
		self.endDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"endDate"]];
		self.completedDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"completedDate"]];
		self.pauseDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"pauseDate"]];
		self.solarSystemName = [attributeDict valueForKey:@"solarSystemName"];
		self.installerName = [attributeDict valueForKey:@"installerName"];
		self.blueprintTypeName = [attributeDict valueForKey:@"blueprintTypeName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.jobID forKey:@"jobID"];
	[aCoder encodeInt64:self.installerID forKey:@"installerID"];
	[aCoder encodeInt32:self.facilityID forKey:@"facilityID"];
	[aCoder encodeInt32:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	[aCoder encodeInt64:self.activityID forKey:@"activityID"];
	[aCoder encodeInt32:self.runs forKey:@"runs"];
	[aCoder encodeInt64:self.blueprintID forKey:@"blueprintID"];
	[aCoder encodeInt64:self.blueprintTypeID forKey:@"blueprintTypeID"];
	[aCoder encodeInt64:self.blueprintLocationID forKey:@"blueprintLocationID"];
	[aCoder encodeInt64:self.outputLocationID forKey:@"outputLocationID"];
	[aCoder encodeInt32:self.teamID forKey:@"teamID"];
	[aCoder encodeInt32:self.licensedRuns forKey:@"licensedRuns"];
	[aCoder encodeInt64:self.productTypeID forKey:@"productTypeID"];
	[aCoder encodeInt32:self.productTypeName forKey:@"productTypeName"];
	[aCoder encodeInt32:self.status forKey:@"status"];
	[aCoder encodeInt32:self.timeInSeconds forKey:@"timeInSeconds"];
	[aCoder encodeInt32:self.activityID forKey:@"activityID"];
	[aCoder encodeInt64:self.completedCharacterID forKey:@"completedCharacterID"];
  
  [aCoder encodeFloat:self.cost forKey:@"cost"];
  [aCoder encodeFloat:self.probability forKey:@"probability"];

	[aCoder encodeObject:self.startDate forKey:@"startDate"];
	[aCoder encodeObject:self.endDate forKey:@"endDate"];
	[aCoder encodeObject:self.completedDate forKey:@"completedDate"];
	[aCoder encodeObject:self.pauseDate forKey:@"pauseDate"];
  
  [aCoder encodeObject:self.installerName forKey:@"installerName"];
  [aCoder encodeObject:self.solarSystemName forKey:@"solarSystemName"];
  [aCoder encodeObject:self.blueprintTypeName forKey:@"blueprintTypeName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.jobID = [aDecoder decodeInt64ForKey:@"jobID"];
		self.installerID = [aDecoder decodeInt64ForKey:@"installerID"];
		self.facilityID = [aDecoder decodeInt32ForKey:@"facilityID"];
		self.solarSystemID = [aDecoder decodeInt32ForKey:@"solarSystemID"];
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		self.activityID = [aDecoder decodeInt32ForKey:@"activityID"];
		self.blueprintID = [aDecoder decodeInt64ForKey:@"blueprintID"];
		self.blueprintTypeID = [aDecoder decodeInt32ForKey:@"blueprintTypeID"];
		self.blueprintLocationID = [aDecoder decodeInt64ForKey:@"blueprintLocationID"];
		self.outputLocationID = [aDecoder decodeInt64ForKey:@"outputLocationID"];
		self.teamID = [aDecoder decodeInt32ForKey:@"teamID"];
		self.licensedRuns = [aDecoder decodeInt32ForKey:@"licensedRuns"];
		self.probability = [aDecoder decodeFloatForKey:@"probability"];
		self.productTypeID = [aDecoder decodeInt32ForKey:@"productTypeID"];
		self.productTypeName = [aDecoder decodeInt32ForKey:@"productTypeName"];
		self.status = [aDecoder decodeInt32ForKey:@"status"];
		self.timeInSeconds = [aDecoder decodeInt32ForKey:@"timeInSeconds"];
		self.completedCharacterID = [aDecoder decodeInt64ForKey:@"completedCharacterID"];
		
		self.cost = [aDecoder decodeFloatForKey:@"cost"];
    
		self.startDate = [aDecoder decodeObjectForKey:@"startDate"];
		self.endDate = [aDecoder decodeObjectForKey:@"endDate"];
		self.pauseDate = [aDecoder decodeObjectForKey:@"pauseDate"];
		self.completedDate = [aDecoder decodeObjectForKey:@"completedDate"];
    
		self.installerName = [aDecoder decodeObjectForKey:@"installerName"];
		self.solarSystemName = [aDecoder decodeObjectForKey:@"solarSystemName"];
		self.blueprintTypeName = [aDecoder decodeObjectForKey:@"blueprintTypeName"];
    
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
