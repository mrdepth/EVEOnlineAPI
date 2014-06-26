//
//  BCEveLoadoutsList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadoutsListItem: NSObject<NSCoding>
@property (nonatomic, assign) int32_t typeID;
@property (nonatomic, assign) int32_t thumbsUp;
@property (nonatomic, assign) int32_t thumbsDown;
@property (nonatomic, assign) int32_t topicID;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, strong) NSDate *posterTime;
@property (nonatomic, strong) NSDate *modifiedTime;
@property (nonatomic, assign) int32_t loadoutID;
@property (nonatomic, assign) int32_t raceID;
@property (nonatomic, assign) int32_t thumbsTotal;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) int32_t memberID;

@end

@interface BCEveLoadoutsList : BCRequest
@property (nonatomic, strong) NSArray *loadouts;

+ (id) eveLoadoutsListWithAPIKey:(NSString*) apiKey raceID:(int32_t) raceID typeID:(int32_t) typeID classID:(int32_t) classID userID:(int32_t) userID tags:(NSArray*) tags error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithAPIKey:(NSString*) apiKey raceID:(int32_t) raceID typeID:(int32_t) typeID classID:(int32_t) classID userID:(int32_t) userID tags:(NSArray*) tags error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end