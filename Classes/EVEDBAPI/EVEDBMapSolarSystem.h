//
//  EVEDBMapSolarSystem.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBMapRegion;
@class EVEDBMapConstellation;
@interface EVEDBMapSolarSystem : NSObject {
	NSInteger regionID;
	EVEDBMapRegion *region;
	NSInteger constellationID;
	EVEDBMapConstellation *constellation;
	NSInteger solarSystemID;
	NSString *solarSystemName;
	float luminosity;
	BOOL border;
	BOOL fringe;
	BOOL corridor;
	BOOL hub;
	BOOL international;
	BOOL regional;
	BOOL isConstellation;
	float security;
	NSInteger factionID;
	float radius;
	NSString *securityClass;
}
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) EVEDBMapRegion *region;
@property (nonatomic) NSInteger constellationID;
@property (nonatomic, retain) EVEDBMapConstellation *constellation;
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic, retain) NSString *solarSystemName;
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
@property (nonatomic, retain) NSString *securityClass;

+ (id) mapSolarSystemWithSolarSystemID: (NSInteger)aSolarSystemID error:(NSError **)errorPtr;
+ (id) mapSolarSystemWithDictionary: (NSDictionary*) dictionary;
- (id) initWithSolarSystemID: (NSInteger)aSolarSystemID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
