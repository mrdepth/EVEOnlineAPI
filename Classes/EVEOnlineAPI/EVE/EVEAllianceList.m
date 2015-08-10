//
//  EVEAllianceList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAllianceList.h"


@implementation EVEAllianceListItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"shortName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"allianceID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"executorCorpID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"memberCount":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"startDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"memberCorporations":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAllianceListMemberCorporationsItem class]}};
	
	return scheme;
}

@end


@implementation EVEAllianceListMemberCorporationsItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"corporationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"startDate":@{@"type":@(EVEXMLSchemePropertyTypeDate)}};
	
	return scheme;
}

@end


@implementation EVEAllianceList
@synthesize alliancesMap = _alliancesMap;

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"alliances":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAllianceListItem class]}};
	
	return scheme;
}

- (NSDictionary*) alliancesMap {
	if (!_alliancesMap) {
		_alliancesMap = [[NSMutableDictionary alloc] initWithCapacity:self.alliances.count];
		for (EVEAllianceListItem* item in self.alliances)
			((NSMutableDictionary*) _alliancesMap)[@(item.allianceID)] = item;
	}
	return _alliancesMap;
}

@end