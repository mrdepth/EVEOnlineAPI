//
//  EVENotificationTexts.h
//  EVEUniverse
//
//  Created by Mr. Depth on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVENotificationTextsItem : NSObject<NSCoding>
@property (nonatomic) int32_t notificationID;
@property (nonatomic, strong) NSDictionary* properties;

+ (id) notificationsTextItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVENotificationTexts : EVERequest
@property (nonatomic, strong) NSArray *notifications;

+ (id) notificationTextsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID ids: (NSArray*) ids error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID ids: (NSArray*) ids error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

