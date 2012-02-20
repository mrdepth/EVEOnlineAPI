//
//  EVEDBMapDenormalize.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBMapRegion;
@class EVEDBMapConstellation;
@class EVEDBMapSolarSystem;
@interface EVEDBMapDenormalize : NSObject {
	NSInteger itemID;
	NSInteger typeID;
	NSInteger groupID;
	NSInteger solarSystemID;
	EVEDBMapSolarSystem *solarSystem;
	NSInteger constellationID;
	EVEDBMapConstellation *constellation;
	NSInteger regionID;
	EVEDBMapRegion *region;
	NSInteger orbitID;
	double x;
	double y;
	double z;
	double radius;
	NSString *itemName;
	double security;
	NSInteger celestialIndex;
	NSInteger orbitIndex;
}
@property (nonatomic) NSInteger itemID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger groupID;
@property(nonatomic) NSInteger solarSystemID;
@property (nonatomic, retain) EVEDBMapSolarSystem *solarSystem;
@property (nonatomic) NSInteger constellationID;
@property (nonatomic, retain) EVEDBMapConstellation *constellation;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) EVEDBMapRegion *region;
@property (nonatomic) NSInteger orbitID;
@property (nonatomic) double x;
@property (nonatomic) double y;
@property (nonatomic) double z;
@property (nonatomic) double radius;
@property (nonatomic, retain) NSString *itemName;
@property (nonatomic) double security;
@property (nonatomic) NSInteger celestialIndex;
@property (nonatomic) NSInteger orbitIndex;

+ (id) mapDenormalizeWithItemID: (NSInteger) aItemID error:(NSError **)errorPtr;
+ (id) mapDenormalizeWithDictionary: (NSDictionary*) dictionary;
- (id) initWithItemID: (NSInteger) aItemID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
