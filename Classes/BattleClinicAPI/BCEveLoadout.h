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
@property (nonatomic, assign) NSInteger loadoutID;
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) NSInteger thumbsUp;
@property (nonatomic, assign) NSInteger thumbsDown;
@property (nonatomic, assign) NSInteger topic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *fitting;

+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
