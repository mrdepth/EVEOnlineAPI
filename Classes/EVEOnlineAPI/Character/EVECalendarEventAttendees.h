//
//  EVECalendarEventAttendees.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECalendarEventAttendeesItem : EVEObject

@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic, strong) NSString *response;

@end

@interface EVECalendarEventAttendees : EVEResult
@property (nonatomic, strong) NSArray *eventAttendees;
@end