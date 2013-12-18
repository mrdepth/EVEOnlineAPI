//
//  EVEContactNotifications.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContactNotificationsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger notificationID;
@property (nonatomic) NSInteger senderID;
@property (nonatomic, copy) NSString *senderName;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, copy) NSString *messageData;

+ (id) contactNotificationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContactNotifications : EVERequest
@property (nonatomic, strong) NSArray *contactNotifications;

+ (id) contactNotificationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
