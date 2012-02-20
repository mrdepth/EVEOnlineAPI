//
//  EVEMetricsItem.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEMetricsRequest.h"
#import "EVEMetricsItemPrice.h"

@interface EVEMetricsItemGlobal: NSObject {
	EVEMetricsItemPrice *sell;
	EVEMetricsItemPrice *buy;
	NSDate *lastUpload;
}
@property (nonatomic, retain) EVEMetricsItemPrice *sell;
@property (nonatomic, retain) EVEMetricsItemPrice *buy;
@property (nonatomic, retain) NSDate *lastUpload;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsItemRegion: NSObject {
	EVEMetricsItemPrice *sell;
	EVEMetricsItemPrice *buy;
	NSDate *lastUpload;
	NSInteger regionID;
	NSString *regionName;
}
@property (nonatomic, retain) EVEMetricsItemPrice *sell;
@property (nonatomic, retain) EVEMetricsItemPrice *buy;
@property (nonatomic, retain) NSDate *lastUpload;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) NSString *regionName;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsItemInfo: NSObject {
	NSString *typeName;
	NSInteger typeID;
	EVEMetricsItemGlobal *global;
	NSMutableArray *regions;
}
@property (nonatomic, retain) NSString *typeName;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) EVEMetricsItemGlobal *global;
@property (nonatomic, retain) NSArray *regions;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsItem: EVEMetricsRequest {
	NSMutableArray *items;
}
@property (nonatomic, retain) NSArray *items;

+ (id) itemWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr;
+ (id) itemWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey error:(NSError **)errorPtr;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs minQuantity: (NSInteger) minQuantity apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;


@end
