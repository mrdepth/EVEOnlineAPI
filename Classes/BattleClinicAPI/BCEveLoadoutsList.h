//
//  BCEveLoadoutsList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadoutsListItem: NSObject
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) NSInteger thumbsUp;
@property (nonatomic, assign) NSInteger thumbsDown;
@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, strong) NSDate *posterTime;
@property (nonatomic, strong) NSDate *modifiedTime;
@property (nonatomic, assign) NSInteger loadoutID;
@property (nonatomic, assign) NSInteger raceID;
@property (nonatomic, assign) NSInteger thumbsTotal;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) NSInteger memberID;

@end

@interface BCEveLoadoutsList : BCRequest
@property (nonatomic, strong) NSArray *loadouts;

+ (id) eveLoadoutsListWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end