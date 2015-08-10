//
//  EVEIndustryJobsHistory.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEIndustryJobsHistory.h"

@implementation EVEIndustryJobsHistory

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"jobs":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEIndustryJobsItem class]}};
	
	return scheme;
}

@end
