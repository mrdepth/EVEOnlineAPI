//
//  EVEContactNotifications.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEContactNotificationsItem : EVEObject
@property (nonatomic) int32_t notificationID;
@property (nonatomic) int32_t senderID;
@property (nonatomic, strong) NSString *senderName;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, strong) NSString *messageData;
@end

@interface EVEContactNotifications : EVEResult
@property (nonatomic, strong) NSArray *contactNotifications;
@end
