//
//  BCEveLoadout.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadout : BCRequest
@property (nonatomic, assign) int32_t loadoutID;
@property (nonatomic, assign) int32_t typeID;
@property (nonatomic, assign) int32_t thumbsUp;
@property (nonatomic, assign) int32_t thumbsDown;
@property (nonatomic, assign) int32_t topic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *fitting;

+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(int32_t)loadoutID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(int32_t)loadoutID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
