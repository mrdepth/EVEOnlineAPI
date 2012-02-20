//
//  EVEUpcomingCalendarEvents.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEUpcomingCalendarEventsItem : NSObject {
	NSInteger eventID;
	NSInteger ownerID;
	NSString *ownerName;
	NSDate *eventDate;
	NSString *eventTitle;
	NSInteger duration;
	NSInteger importance;
	NSString *response;
	NSString *eventText;
}

@property (nonatomic) NSInteger eventID;
@property (nonatomic) NSInteger ownerID;
@property (nonatomic, copy) NSString *ownerName;
@property (nonatomic, retain) NSDate *eventDate;
@property (nonatomic, copy) NSString *eventTitle;
@property (nonatomic) NSInteger duration;
@property (nonatomic) NSInteger importance;
@property (nonatomic, copy) NSString *response;
@property (nonatomic, copy) NSString *eventText;

+ (id) upcomingCalendarEventsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEUpcomingCalendarEvents : EVERequest {
	NSMutableArray *upcomingCalendarEvents;
}
@property (nonatomic, retain) NSArray *upcomingCalendarEvents;

+ (id) upcomingCalendarEventsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) upcomingCalendarEventsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
