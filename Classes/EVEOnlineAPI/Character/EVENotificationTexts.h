//
//  EVENotificationTexts.h
//  EVEUniverse
//
//  Created by Mr. Depth on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVENotificationTextsItem : NSObject {
	NSInteger notificationID;
	NSDictionary* properties;
}
@property (nonatomic) NSInteger notificationID;
@property (nonatomic, retain) NSDictionary* properties;

+ (id) notificationsTextItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVENotificationTexts : EVERequest {
	NSMutableArray *notifications;
}
@property (nonatomic, retain) NSArray *notifications;

+ (id) notificationTextsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr;
+ (id) notificationTextsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)object;

@end

