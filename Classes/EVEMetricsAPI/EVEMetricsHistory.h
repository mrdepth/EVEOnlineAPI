//
//  EVEMetricsHistory.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEMetricsRequest.h"
#import "EVEMetricsItemPrice.h"

@interface EVEMetricsHistoryInfo: NSObject {
	float min;
	float max;
	float avg;
	NSInteger orders;
	NSInteger amount;
	NSDate *date;
}
@property (nonatomic) float min;
@property (nonatomic) float max;
@property (nonatomic) float avg;
@property (nonatomic) NSInteger orders;
@property (nonatomic) NSInteger amount;
@property (nonatomic, retain) NSDate *date;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsHistoryGlobal: NSObject {
	EVEMetricsItemPrice *sell;
	EVEMetricsItemPrice *buy;
	NSMutableArray *history;
	NSDate *lastUpload;
	NSDate *lastOrderUpload;
}
@property (nonatomic, retain) EVEMetricsItemPrice *sell;
@property (nonatomic, retain) EVEMetricsItemPrice *buy;
@property (nonatomic, retain) NSArray *history;
@property (nonatomic, retain) NSDate *lastUpload;
@property (nonatomic, retain) NSDate *lastOrderUpload;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsHistoryRegion: NSObject {
	EVEMetricsItemPrice *sell;
	EVEMetricsItemPrice *buy;
	NSMutableArray *history;
	NSDate *lastUpload;
	NSDate *lastOrderUpload;
	NSInteger regionID;
	NSString *regionName;
}
@property (nonatomic, retain) EVEMetricsItemPrice *sell;
@property (nonatomic, retain) EVEMetricsItemPrice *buy;
@property (nonatomic, retain) NSArray *history;
@property (nonatomic, retain) NSDate *lastUpload;
@property (nonatomic, retain) NSDate *lastOrderUpload;
@property (nonatomic) NSInteger regionID;
@property (nonatomic, retain) NSString *regionName;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsHistoryItemInfo: NSObject {
	NSString *typeName;
	NSInteger typeID;
	EVEMetricsHistoryGlobal *global;
	NSMutableArray *regions;
}
@property (nonatomic, retain) NSString *typeName;
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) EVEMetricsHistoryGlobal *global;
@property (nonatomic, retain) NSArray *regions;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end


@interface EVEMetricsHistory: EVEMetricsRequest {
	NSMutableArray *items;
}
@property (nonatomic, retain) NSArray *items;

+ (id) historyWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey error:(NSError **)errorPtr;
+ (id) historyWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey error:(NSError **)errorPtr;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs days: (NSInteger) days apiKey: (NSString*) apiKey target:(id)target action:(SEL)action object:(id)object;


@end
