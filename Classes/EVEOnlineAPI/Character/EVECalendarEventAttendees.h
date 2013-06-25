//
//  EVECalendarEventAttendees.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECalendarEventAttendeesItem : NSObject

@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic, copy) NSString *response;

+ (id) calendarEventAttendeesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECalendarEventAttendees : EVERequest
@property (nonatomic, strong) NSArray *eventAttendees;

+ (id) calendarEventAttendeesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end