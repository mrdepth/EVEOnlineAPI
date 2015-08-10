//
//  EVEFacilities.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEFacilities.h"

@implementation EVEFacilitiesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"facilityID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"regionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"regionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"starbaseModifier":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"tax":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end

@implementation EVEFacilities

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"facilities":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEFacilitiesItem class]}};
	
	return scheme;
}

@end
