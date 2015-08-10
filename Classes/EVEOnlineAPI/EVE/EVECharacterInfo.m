//
//  EVECharacterInfo.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.12.12.
//
//

#import "EVECharacterInfo.h"

@implementation EVECharacterInfoEmploymentHistoryItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"recordID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporationName":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"startDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	return scheme;
}

@end

#pragma mark --

@implementation EVECharacterInfo

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"characterID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"characterName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"race":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"bloodLineID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"bloodLine":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ancestryID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"ancestry":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"accountBalance":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"skillPoints":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"shipTypeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"shipTypeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"corporation":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"corporationDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"alliance":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"lastKnownLocation":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"securityStatus":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"employmentHistory":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVECharacterInfoEmploymentHistoryItem class]}};
	
	return scheme;
}

@end

