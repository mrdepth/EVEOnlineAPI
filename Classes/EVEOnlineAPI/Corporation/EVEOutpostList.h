//
//  EVEOutpostList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEOutpostListItem : NSObject<NSCoding>
@property (nonatomic) int32_t stationID;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) float dockingCostPerShipVolume;
@property (nonatomic) float officeRentalCost;
@property (nonatomic) int32_t stationTypeID;
@property (nonatomic) float reprocessingEfficiency;
@property (nonatomic) float reprocessingStationTake;
@property (nonatomic) int32_t standingOwnerID;

+ (id) outpostListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEOutpostList : EVERequest
@property (nonatomic, strong) NSArray *corporationStarbases;

+ (id) outpostListWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end