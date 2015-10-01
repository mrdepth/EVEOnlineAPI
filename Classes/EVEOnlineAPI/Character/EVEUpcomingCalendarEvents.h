//
//  EVEUpcomingCalendarEvents.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEUpcomingCalendarEventsItem : EVEObject
@property (nonatomic) int32_t eventID;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSDate *eventDate;
@property (nonatomic, strong) NSString *eventTitle;
@property (nonatomic) int32_t duration;
@property (nonatomic) int32_t importance;
@property (nonatomic, strong) NSString *response;
@property (nonatomic, strong) NSString *eventText;
@end

@interface EVEUpcomingCalendarEvents : EVEResult
@property (nonatomic, strong) NSArray *upcomingEvents;
@end
