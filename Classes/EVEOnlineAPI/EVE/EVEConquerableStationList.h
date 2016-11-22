//
//  EVEConquerableStationList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEConquerableStationListItem : EVEObject
@property (nonatomic) int32_t stationID;
@property (nonatomic, strong) NSString *stationName;
@property (nonatomic) int32_t stationTypeID;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;
@end


@interface EVEConquerableStationList : EVEResult
@property (nonatomic, strong) NSArray *outposts;
@end
