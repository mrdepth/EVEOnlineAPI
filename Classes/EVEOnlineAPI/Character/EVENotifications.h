//
//  EVENotifications.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVENotificationsItem : EVEObject
@property (nonatomic) int32_t notificationID;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t senderID;
@property (nonatomic, strong) NSString *senderName;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic) BOOL read;
@end

@interface EVENotifications : EVEResult
@property (nonatomic, strong) NSArray *notifications;
@end

