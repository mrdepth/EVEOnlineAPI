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
@property (nonatomic) int32_t notificationID;
@property (nonatomic) int32_t senderID;
@property (nonatomic, copy) NSString *senderName;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, copy) NSString *messageData;

+ (id) contactNotificationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContactNotifications : EVERequest
@property (nonatomic, strong) NSArray *contactNotifications;

+ (id) contactNotificationsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
