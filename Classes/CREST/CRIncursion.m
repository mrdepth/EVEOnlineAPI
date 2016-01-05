//
//  CRIncursion.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.01.16.
//
//

#import "CRIncursion.h"

@implementation CRIncursion

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"influence":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"hasBoss":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"state":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
					   if ([value isKindOfClass:[NSString class]]) {
						   if ([value compare:@"Mobilizing" options:NSCaseInsensitiveSearch] == NSOrderedSame)
							   return @(CRIncursionStateMobilizing);
						   else if ([value compare:@"Established" options:NSCaseInsensitiveSearch] == NSOrderedSame)
							   return @(CRIncursionStateEstablished);
						   else if ([value compare:@"Withdrawing" options:NSCaseInsensitiveSearch] == NSOrderedSame)
							   return @(CRIncursionStateWithdrawing);
					   }
					   return @(CRIncursionStateUnknown);
				   }},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"stagingSolarSystem.id"},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"stagingSolarSystem.name"},
				   @"constellationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"constellation.id"},
				   @"constellationName":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"constellation.name"}};
	
	return scheme;
}

@end

@implementation CRIncursionCollection

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRIncursion class]}};
	return scheme;
}

+ (NSString*) contentType {
	return @"application/vnd.ccp.eve.IncursionCollection-v1+json; charset=utf-8";
}

@end
