//
//  EVECustomsOffices.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVECustomsOffices.h"

@implementation EVECustomsOfficesItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"itemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"solarSystemName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"reinforceHour":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allowAlliance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"allowStandings":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"standingLevel":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateAlliance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateCorp":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateStandingHigh":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateStandingGood":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateStandingNeutral":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateStandingBad":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"taxRateStandingHorrible":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	
	return scheme;
}

@end

@implementation EVECustomsOffices

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"pocos":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECustomsOfficesItem class]}};
	
	return scheme;
}

@end
