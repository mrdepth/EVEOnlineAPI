//
//  EVECalendarEventAttendees.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECalendarEventAttendeesItem : NSObject {
	NSInteger characterID;
	NSString *characterName;
	NSString *response;
}

@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic, copy) NSString *response;

+ (id) calendarEventAttendeesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECalendarEventAttendees : EVERequest {
	NSMutableArray *eventAttendees;
}
@property (nonatomic, retain) NSArray *eventAttendees;

+ (id) calendarEventAttendeesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr;
+ (id) calendarEventAttendeesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID eventID: (NSInteger) eventID target:(id)target action:(SEL)action object:(id)object;

@end