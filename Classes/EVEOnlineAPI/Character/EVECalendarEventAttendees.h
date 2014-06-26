//
//  EVECalendarEventAttendees.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECalendarEventAttendeesItem : NSObject<NSCoding>

@property (nonatomic) int32_t characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic, copy) NSString *response;

+ (id) calendarEventAttendeesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECalendarEventAttendees : EVERequest
@property (nonatomic, strong) NSArray *eventAttendees;

+ (id) calendarEventAttendeesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID eventID: (int32_t) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID eventID: (int32_t) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end