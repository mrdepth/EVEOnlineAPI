//
//  EVESkillQueue.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillQueue.h"


@implementation EVESkillQueueItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"queuePosition":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"level":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"startSP":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"endSP":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"startTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"endTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}

@end


@implementation EVESkillQueue

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"skillQueue":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVESkillQueueItem class], @"elementName": @"skillqueue"}};
	
	return scheme;
}

- (NSTimeInterval) timeLeft {
	NSDate *endTime = [[self.skillQueue lastObject] endTime];
	return [endTime timeIntervalSinceDate:[self.eveapi serverTimeWithLocalTime:[NSDate date]]];
}


@end