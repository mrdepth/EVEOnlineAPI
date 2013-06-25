//
//  EVEOutpostList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEOutpostListItem : NSObject
@property (nonatomic) NSInteger stationID;
@property (nonatomic) NSInteger ownerID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) float dockingCostPerShipVolume;
@property (nonatomic) float officeRentalCost;
@property (nonatomic) NSInteger stationTypeID;
@property (nonatomic) float reprocessingEfficiency;
@property (nonatomic) float reprocessingStationTake;
@property (nonatomic) NSInteger standingOwnerID;

+ (id) outpostListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEOutpostList : EVERequest
@property (nonatomic, strong) NSArray *corporationStarbases;

+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end