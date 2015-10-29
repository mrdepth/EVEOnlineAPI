//
//  EVECallList.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECallList.h"


@implementation EVECallListCallGroupsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"groupID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"callGroupDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"}};
	
	return scheme;
}

@end


@implementation EVECallListCallsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"accessMask":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"type":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
					   if ([value isKindOfClass:[NSString class]])
						return [value isEqualToString:@"Corporation"] ? @(EVECallTypeCorporation) : @(EVECallTypeCharacter);
					   else
						return @(EVECallTypeCharacter);
				   }},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"groupID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"callDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"}};
	
	return scheme;
}

@end


@implementation EVECallList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"callGroups":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECallListCallGroupsItem class]},
				   @"calls":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECallListCallsItem class]}};
	
	return scheme;
}

@end