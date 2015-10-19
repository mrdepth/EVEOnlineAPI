//
//  EVEzKillBoardSearch.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 25.02.14.
//
//

#import <Foundation/Foundation.h>
#import "EVEObject.h"

#define EVEzKillBoardSearchFilterLimitKey @"limit"
#define EVEzKillBoardSearchFilterPageKey @"page"
#define EVEzKillBoardSearchFilterStartTimeKey @"startTime"
#define EVEzKillBoardSearchFilterEndTimeKey @"endTime"
#define EVEzKillBoardSearchFilterYearKey @"year"
#define EVEzKillBoardSearchFilterMonthKey @"month"
#define EVEzKillBoardSearchFilterWeekKey @"week"
#define EVEzKillBoardSearchFilterBeforeKillIDKey @"beforeKillID"
#define EVEzKillBoardSearchFilterAfterKillIDKey @"afterKillID"
#define EVEzKillBoardSearchFilterPastSecondsKey @"pastSeconds"
#define EVEzKillBoardSearchFilterKillsKey @"kills"
#define EVEzKillBoardSearchFilterLossesKey @"losses"
#define EVEzKillBoardSearchFilterWSpaceKey @"w-space"
#define EVEzKillBoardSearchFilterSoloKey @"solo"
#define EVEzKillBoardSearchFilterLowsecKey @"lowsec"
#define EVEzKillBoardSearchFilterHighsecKey @"highsec"
#define EVEzKillBoardSearchFilterNullsecKey @"nullsec"
#define EVEzKillBoardSearchFilterOrderDirectionKey @"orderDirection"
#define EVEzKillBoardSearchFilterCharacterIDKey @"characterID"
#define EVEzKillBoardSearchFilterCorporationIDKey @"corporationID"
#define EVEzKillBoardSearchFilterAllianceIDKey @"allianceID"
#define EVEzKillBoardSearchFilterFactionIDKey @"factionID"
#define EVEzKillBoardSearchFilterShipTypeIDKey @"shipTypeID"
#define EVEzKillBoardSearchFilterGroupIDKey @"groupID"
#define EVEzKillBoardSearchFilterSolarSystemIDKey @"solarSystemID"
#define EVEzKillBoardSearchFilterRegionIDKey @"regionID"
#define EVEzKillBoardSearchFilterNoItemsIDKey @"no-items"
#define EVEzKillBoardSearchFilterNoAttackersIDKey @"no-attackers"
#define EVEzKillBoardSearchFilterApiOnlyIDKey @"api-only"

#define EVEzKillBoardSearchFilterOrderDirectionAscending @"asc"
#define EVEzKillBoardSearchFilterOrderDirectionDescending @"desc"


@interface EVEzKillBoardSearch : EVEObject
@property (nonatomic, strong) NSArray* kills;
@end
