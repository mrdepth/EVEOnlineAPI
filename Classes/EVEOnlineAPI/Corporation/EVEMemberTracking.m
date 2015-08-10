//
//  EVEMemberTracking.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberTracking.h"


@implementation EVEMemberTrackingItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"startDateTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"baseID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"base":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"title":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"logonDateTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"logoffDateTime":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"locationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"location":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"shipTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipType":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"roles":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"grantableRoles":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVEMemberTracking

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"members":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEMemberTrackingItem class]}};
	
	return scheme;
}


@end