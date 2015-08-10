//
//  EVEResearch.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResearch.h"


@implementation EVEResearchItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"agentID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"skillTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"researchStartDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"pointsPerDay":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"remainderPoints":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEResearch

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"research":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEResearchItem class]}};
	
	return scheme;
}

@end