//
//  EVEOutpostList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEOutpostListItem : NSObject {
	NSInteger stationID;
	NSInteger ownerID;
	NSString *stationName;
	NSInteger solarSystemID;
	float dockingCostPerShipVolume;
	float officeRentalCost;
	NSInteger stationTypeID;
	float reprocessingEfficiency;
	float reprocessingStationTake;
	NSInteger standingOwnerID;
}
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

@interface EVEOutpostList : EVERequest {
	NSMutableArray *corporationStarbases;
}
@property (nonatomic, retain) NSArray *corporationStarbases;

+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end