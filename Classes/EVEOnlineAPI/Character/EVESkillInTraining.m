//
//  EVESkillInTraining.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillInTraining.h"


@implementation EVESkillInTraining

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"currentTQTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"trainingEndTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"trainingStartTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"trainingTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"trainingStartSP":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"trainingDestinationSP":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"trainingToLevel":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"skillInTraining":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end