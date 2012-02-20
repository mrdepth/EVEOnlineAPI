//
//  EVECentralMarketStat.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECentralRequest.h"

@interface EVECentralMarketStatTypeStat : NSObject {
	float volume;
	float avg;
	float max;
	float min;
	float stddev;
	float median;
}
@property (nonatomic) float volume;
@property (nonatomic) float avg;
@property (nonatomic) float max;
@property (nonatomic) float min;
@property (nonatomic) float stddev;
@property (nonatomic) float median;

+ (id) marketStatTypeStat;

@end


@interface EVECentralMarketStatType: NSObject {
	NSInteger typeID;
	EVECentralMarketStatTypeStat *all;
	EVECentralMarketStatTypeStat *buy;
	EVECentralMarketStatTypeStat *sell;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) EVECentralMarketStatTypeStat *all;
@property (nonatomic, retain) EVECentralMarketStatTypeStat *buy;
@property (nonatomic, retain) EVECentralMarketStatTypeStat *sell;

+ (id) marketStatTypeStatWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end

@interface EVECentralMarketStat : EVECentralRequest {
	NSMutableArray *types;
	EVECentralMarketStatType *currentType;
	EVECentralMarketStatTypeStat *currentStat;
}
@property (nonatomic, retain) NSArray *types;

+ (id) marketStatWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr;
+ (id) marketStatWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)object;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ error:(NSError **)errorPtr;
- (id) initWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ target:(id)target action:(SEL)action object:(id)object;
@end

@interface EVECentralMarketStat(Private)
- (NSString*) argumentsStringWithTypeIDs: (NSArray*) typeIDs regionIDs: (NSArray*) regionIDs hours: (NSInteger) hours minQ: (NSInteger) minQ;
@end