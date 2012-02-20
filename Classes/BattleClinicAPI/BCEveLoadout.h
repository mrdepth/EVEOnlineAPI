//
//  BCEveLoadout.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadout : BCRequest {
	NSInteger loadoutID;
	NSInteger typeID;
	NSInteger thumbsUp;
	NSInteger thumbsDown;
	NSInteger topic;
	NSString *title;
	NSString *description;
	NSString *fitting;
}
@property (nonatomic, assign) NSInteger loadoutID;
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) NSInteger thumbsUp;
@property (nonatomic, assign) NSInteger thumbsDown;
@property (nonatomic, assign) NSInteger topic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *fitting;

+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID target:(id)target action:(SEL)action object:(id)object;
+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID error:(NSError **)errorPtr;
- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID error:(NSError **)errorPtr;

@end
