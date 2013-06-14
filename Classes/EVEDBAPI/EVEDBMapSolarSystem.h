//
//  EVEDBMapSolarSystem.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBMapRegion;
@class EVEDBMapConstellation;
@interface EVEDBMapSolarSystem : EVEDBObject
@property (nonatomic) NSInteger regionID;
@property (nonatomic, strong) EVEDBMapRegion *region;
@property (nonatomic) NSInteger constellationID;
@property (nonatomic, strong) EVEDBMapConstellation *constellation;
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic, strong) NSString *solarSystemName;
@property (nonatomic) float luminosity;
@property (nonatomic) BOOL border;
@property (nonatomic) BOOL fringe;
@property (nonatomic) BOOL corridor;
@property (nonatomic) BOOL hub;
@property (nonatomic) BOOL international;
@property (nonatomic) BOOL regional;
@property (nonatomic) BOOL isConstellation;
@property (nonatomic) float security;
@property (nonatomic) NSInteger factionID;
@property (nonatomic) float radius;
@property (nonatomic, strong) NSString *securityClass;

+ (id) mapSolarSystemWithSolarSystemID: (NSInteger)aSolarSystemID error:(NSError **)errorPtr;
+ (id) mapSolarSystemWithSolarSystemName: (NSString*)aSolarSystemName error:(NSError **)errorPtr;
- (id) initWithSolarSystemID: (NSInteger)aSolarSystemID error:(NSError **)errorPtr;
- (id) initWithSolarSystemName: (NSString*)aSolarSystemName error:(NSError **)errorPtr;

@end
