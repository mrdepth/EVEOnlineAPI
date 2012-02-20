//
//  EVEContactNotifications.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContactNotificationsItem : NSObject {
	NSInteger notificationID;
	NSInteger senderID;
	NSString *senderName;
	NSDate *sentDate;
	NSString *messageData;
}
@property (nonatomic) NSInteger notificationID;
@property (nonatomic) NSInteger senderID;
@property (nonatomic, copy) NSString *senderName;
@property (nonatomic, retain) NSDate *sentDate;
@property (nonatomic, copy) NSString *messageData;

+ (id) contactNotificationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContactNotifications : EVERequest {
	NSMutableArray *contactNotifications;
}
@property (nonatomic, retain) NSArray *contactNotifications;

+ (id) contactNotificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) contactNotificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
