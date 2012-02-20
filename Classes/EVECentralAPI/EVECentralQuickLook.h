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
@interface EVECentralQuickLookOrder: NSObject {
	NSInteger orderID;
	NSInteger regionID;
	EVEDBMapRegion *region;
	NSInteger stationID;
	EVEDBStaStation *station;
	NSString *stationName;
	float security;
	NSInteger range;
	float price;
	NSInteger volRemain;
	NSInteger minVolume;
	NSDate *expires;
	NSDate *reportedTime;
}
@property (nonatomic) NSInteger orderID;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) EVEDBMapRegion *region;
@property (nonatomic) NSInteger stationID;
@property (nonatomic, retain) EVEDBStaStation *station;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) float security;
@property (nonatomic) NSInteger range;
@property (nonatomic) float price;
@property (nonatomic) NSInteger volRemain;
@property (nonatomic) NSInteger minVolume;
@property (nonatomic, retain) NSDate *expires;
@property (nonatomic, retain) NSDate *reportedTime;

+ (id) quickLookOrderWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end

@interface EVECentralQuickLook : EVECentralRequest {
	NSInteger typeID;
	NSString *typeName;
	NSMutableArray *regions;
	NSInteger hours;
	NSInteger minQ;
	NSMutableArray *sellOrders;
	NSMutableArray *buyOrders;

@private
	NSMutableArray *currentOrders;
	EVECentralQuickLookOrder *currentOrder;
	NSDateFormatter *expiresDateFormatter;
	NSDateFormatter *reportedTimeDateFormatter;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, retain) NSMutableArray *regions;
@property (nonatomic) NSInteger hours;
@property (nonatomic) NSInteger minQ;
@property (nonatomic, retain) NSMutableArray *sellOrders;
@property (nonatomic, retain) NSMutableArray *buyOrders;

+ (id) quickLookWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr;
+ (id) quickLookWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)object;
- (id) initWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr;
- (id) initWithTypeID: (NSInteger) typeID regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)object;
@end

@interface EVECentralQuickLook(Private)
- (NSString*) argumentsStringWithTypeID: (NSInteger) typeIDs regionIDs: (NSArray*) regionIDs systemID: (NSInteger) systemID hours: (NSInteger) hours minQ: (NSInteger) minQ;
@end