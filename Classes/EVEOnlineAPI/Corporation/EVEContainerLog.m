//
//  EVEContainerLog.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEContainerLog.h"


@implementation EVEContainerLogItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"logTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"itemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"itemTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"actorID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"actorName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"flag":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"locationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"action":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"passwordType":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"oldConfiguration":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"theNewConfiguration":@{@"type":@(EVEXMLSchemePropertyTypeString)}, @"elementName":@"newConfiguration"};
	
	return scheme;
}

@end


@implementation EVEContainerLog

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"containerLog":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContainerLogItem class]}};
	
	return scheme;
}

@end