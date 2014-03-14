//
//  EVEUpcomingCalendarEvents.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEUpcomingCalendarEventsItem : NSObject<NSCoding>
@property (nonatomic) int32_t eventID;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, copy) NSString *ownerName;
@property (nonatomic, strong) NSDate *eventDate;
@property (nonatomic, copy) NSString *eventTitle;
@property (nonatomic) int32_t duration;
@property (nonatomic) int32_t importance;
@property (nonatomic, copy) NSString *response;
@property (nonatomic, copy) NSString *eventText;

+ (id) upcomingCalendarEventsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEUpcomingCalendarEvents : EVERequest
@property (nonatomic, strong) NSArray *upcomingCalendarEvents;

+ (id) upcomingCalendarEventsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
