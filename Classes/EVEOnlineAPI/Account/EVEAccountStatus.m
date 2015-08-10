//
//  EVEAccountStatus.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAccountStatus.h"

@implementation EVEAccountStatusMultiCharacterTrainingItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"trainingEnd":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	return scheme;
}

@end

@implementation EVEAccountStatus

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"paidUntil":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"createDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"logonCount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"logonMinutes":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"multiCharacterTraining":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAccountStatusMultiCharacterTrainingItem class]}};
	return scheme;
}

@end