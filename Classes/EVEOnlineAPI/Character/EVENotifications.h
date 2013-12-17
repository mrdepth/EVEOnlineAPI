//
//  EVENotifications.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVENotificationsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger notificationID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger senderID;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic) BOOL read;

+ (id) notificationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVENotifications : EVERequest
@property (nonatomic, strong) NSArray *notifications;

+ (id) notificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

