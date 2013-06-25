//
//  EVEDBMapConstellation.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBMapRegion;
@interface EVEDBMapConstellation : EVEDBObject
@property(nonatomic) NSInteger regionID;
@property(nonatomic, strong) EVEDBMapRegion *region;
@property(nonatomic) NSInteger constellationID;
@property(nonatomic, strong) NSString *constellationName;
@property(nonatomic) NSInteger factionID;
@property(nonatomic) float radius;

+ (id) mapConstellationWithConstellationID: (NSInteger)aConstellationID error:(NSError **)errorPtr;
- (id) initWithConstellationID: (NSInteger)aConstellationID error:(NSError **)errorPtr;

@end
