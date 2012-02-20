//
//  EVENotifications.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVENotificationsItem : NSObject {
	NSInteger notificationID;
	NSInteger typeID;
	NSInteger senderID;
	NSDate *sentDate;
	BOOL read;
}
@property (nonatomic) NSInteger notificationID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger senderID;
@property (nonatomic, retain) NSDate *sentDate;
@property (nonatomic) BOOL read;

+ (id) notificationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVENotifications : EVERequest {
	NSMutableArray *notifications;
}
@property (nonatomic, retain) NSArray *notifications;

+ (id) notificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) notificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end

