//
//  EVENotificationTexts.h
//  EVEUniverse
//
//  Created by Mr. Depth on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVENotificationTextsItem : EVEObject
@property (nonatomic) int32_t notificationID;
@property (nonatomic, strong) NSDictionary* properties;
@end

@interface EVENotificationTexts : EVEResult
@property (nonatomic, strong) NSArray *notifications;
@end

