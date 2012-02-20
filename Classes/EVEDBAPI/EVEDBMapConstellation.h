//
//  EVEDBMapConstellation.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBMapRegion;
@interface EVEDBMapConstellation : NSObject {
	NSInteger regionID;
	EVEDBMapRegion *region;
	NSInteger constellationID;
	NSString *constellationName;
	NSInteger factionID;
	float radius;
}
@property(nonatomic) NSInteger regionID;
@property(nonatomic, retain) EVEDBMapRegion *region;
@property(nonatomic) NSInteger constellationID;
@property(nonatomic, retain) NSString *constellationName;
@property(nonatomic) NSInteger factionID;
@property(nonatomic) float radius;

+ (id) mapConstellationWithConstellationID: (NSInteger)aConstellationID error:(NSError **)errorPtr;
+ (id) mapConstellationWithDictionary: (NSDictionary*) dictionary;
- (id) initWithConstellationID: (NSInteger)aConstellationID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
