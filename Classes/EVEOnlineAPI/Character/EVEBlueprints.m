//
//  EVEBlueprints.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEBlueprints.h"

@implementation EVEBlueprintsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"itemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"locationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"flag":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"flagID"},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"timeEfficiency":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"materialEfficiency":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"runs":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

@end

@implementation EVEBlueprints

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"blueprints":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEBlueprintsItem class]}};
	return scheme;
}

@end
