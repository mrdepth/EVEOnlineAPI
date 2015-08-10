//
//  EVEAllianceList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEAllianceListItem : EVEObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic) int32_t executorCorpID;
@property (nonatomic) int32_t memberCount;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSArray *memberCorporations;
@end


@interface EVEAllianceListMemberCorporationsItem : EVEObject
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSDate *startDate;
@end


@interface EVEAllianceList : EVEResult
@property (nonatomic, strong) NSArray *alliances;
@property (nonatomic, strong, readonly) NSDictionary* alliancesMap;
@end
