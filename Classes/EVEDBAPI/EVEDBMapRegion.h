//
//  EVEDBMapRegion.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBMapRegion : NSObject {
	NSInteger regionID;
	NSString *regionName;
	NSInteger factionID;
	float radius;
}
@property(nonatomic) NSInteger regionID;
@property(nonatomic, retain) NSString *regionName;
@property(nonatomic) NSInteger factionID;
@property(nonatomic) float radius;


+ (id) mapRegionWithRegionID: (NSInteger)aRegionID error:(NSError **)errorPtr;
+ (id) mapRegionWithDictionary: (NSDictionary*) dictionary;
- (id) initWithRegionID: (NSInteger)aRegionID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;
@end
