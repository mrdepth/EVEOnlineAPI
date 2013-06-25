//
//  EVEDBMapRegion.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"


@interface EVEDBMapRegion : EVEDBObject
@property(nonatomic) NSInteger regionID;
@property(nonatomic, strong) NSString *regionName;
@property(nonatomic) NSInteger factionID;
@property(nonatomic) float radius;


+ (id) mapRegionWithRegionID: (NSInteger)aRegionID error:(NSError **)errorPtr;
- (id) initWithRegionID: (NSInteger)aRegionID error:(NSError **)errorPtr;
@end
