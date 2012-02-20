//
//  EVEMetricsOrders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEMetricsRequest.h"
#import "EVEMetricsItemPrice.h"

@interface EVEMetricsOrderInfo: NSObject {
	NSInteger eveID;
	BOOL sell;
	NSInteger range;
	NSInteger initialVolume;
	NSInteger availableVolume;
	NSInteger saleVolume;
	NSInteger stationID;
	NSInteger systemID;
	NSInteger regionID;
	NSDate *issuedAt;
	NSInteger typeID;
	NSDate *expiresAt;
	NSDate *createdAt;
	NSDate *updatedAt;
	BOOL trusted;
	float price;
}

@property (nonatomic) NSInteger eveID;
@property (nonatomic) BOOL sell;
@property (nonatomic) NSInteger range;
@property (nonatomic) NSInteger initialVolume;
@property (nonatomic) NSInteger availableVolume;
@property (nonatomic) NSInteger saleVolume;
@property (nonatomic) NSInteger stationID;
@property (nonatomic) NSInteger systemID;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) NSDate *issuedAt;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) NSDate *expiresAt;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;
@property (nonatomic) BOOL trusted;
@property (nonatomic) float price;

- (id) initWithDictionary: (NSDictionary*) dictionary;

- (NSComparisonResult) compareByPriceAscending: (EVEMetricsOrderInfo*) other;
- (NSComparisonResult) compareByPriceDescending: (EVEMetricsOrderInfo*) other;

@end


@interface EVEMetricsOrdersRegion: NSObject {
	NSInteger regionID;
	NSMutableArray *buyOrders;
	NSMutableArray *sellOrders;
}
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) NSArray *buyOrders;
@property (nonatomic, retain) NSArray *sellOrders;

@end


@interface EVEMetricsOrdersItemInfo: NSObject {
	NSString *typeName;
	NSInteger typeID;
	NSMutableArray *regions;
}
@property (nonatomic, retain) NSString *typeName;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) NSArray *regions;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsOrders: EVEMetricsRequest {
	NSMutableArray *items;
}
@property (nonatomic, retain) NSArray *items;

+ (id) ordersWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr;
+ (id) ordersWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;


@end