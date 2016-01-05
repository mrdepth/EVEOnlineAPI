//
//  CRSolarSystem.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.01.16.
//
//

#import "CRSolarSystem.h"

@implementation CRSolarSystem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"securityStatus":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"securityClass":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ownerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"sovereignty.id"},
				   @"ownerName":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"sovereignty.name"}};
	
	return scheme;
}

+ (NSString*) contentType {
	return @"application/vnd.ccp.eve.System-v1+json; charset=utf-8";
}

@end
