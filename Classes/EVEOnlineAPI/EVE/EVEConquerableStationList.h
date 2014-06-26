//
//  EVEConquerableStationList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEConquerableStationListItem : NSObject<NSCoding>
@property (nonatomic) int32_t stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic) int32_t stationTypeID;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;

+ (id) conquerableStationListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEConquerableStationList : EVERequest
@property (nonatomic, strong) NSArray *outposts;

+ (id) conquerableStationListWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end