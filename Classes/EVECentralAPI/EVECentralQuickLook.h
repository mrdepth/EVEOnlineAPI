//
//  EVECentralQuickLook.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECentralRequest.h"

@class EVEDBMapRegion;
@class EVEDBStaStation;
@interface EVECentralQuickLookOrder: NSObject
@property (nonatomic) NSInteger orderID;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, strong) EVEDBMapRegion *region;
@property (nonatomic) NSInteger stationID;
@property (nonatomic, strong) EVEDBStaStation *station;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) float security;
@property (nonatomic) NSInteger range;
@property (nonatomic) float price;
@property (nonatomic) NSInteger volRemain;
@property (nonatomic) NSInteger minVolume;
@property (nonatomic, strong) NSDate *expires;
@property (nonatomic, strong) NSDate *reportedTime;

+ (id) quickLookOrderWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end

@interface EVECentralQuickLook : EVECentralRequest
@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, strong) NSMutableArray *regions;
@property (nonatomic) NSInteger hours;
@property (nonatomic) NSInteger minQ;
@property (nonatomic, strong) NSMutableArray *sellOrders;
@property (nonatomic, strong) NSMutableArray *buyOrders;

+ (id) quickLookWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
