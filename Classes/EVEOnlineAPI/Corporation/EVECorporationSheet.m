//
//  EVECorporationSheet.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorporationSheet.h"


@implementation EVECorporationSheetDivisionItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"accountKey":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"divisionDescription":@{@"type":@(EVEXMLSchemePropertyTypeString)}, @"elementName":@"description"};
	
	return scheme;
}

@end

@implementation EVECorporationSheetLogo

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"graphicID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shape1":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shape2":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shape3":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"color1":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"color2":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"color3":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end


@implementation EVECorporationSheet

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ticker":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ceoID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ceoName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"stationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"stationName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"},
				   @"url":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allianceName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"factionID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"factionName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"taxRate":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"memberCount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"memberLimit":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shares":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"divisions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECorporationSheetDivisionItem class]},
				   @"walletDivisions":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECorporationSheetDivisionItem class]},
				   @"logo":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVECorporationSheetLogo class]}};
	
	return scheme;
}

@end
