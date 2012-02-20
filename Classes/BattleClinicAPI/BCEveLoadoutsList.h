//
//  BCEveLoadoutsList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCRequest.h"

@interface BCEveLoadoutsListItem: NSObject {
	NSInteger typeID;
	NSInteger thumbsUp;
	NSInteger thumbsDown;
	NSInteger topicID;
	NSString *subject;
	NSDate *posterTime;
	NSDate *modifiedTime;
	NSInteger loadoutID;
	NSInteger raceID;
	NSInteger thumbsTotal;
	NSString *author;
	NSInteger memberID;
}
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, assign) NSInteger thumbsUp;
@property (nonatomic, assign) NSInteger thumbsDown;
@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, retain) NSDate *posterTime;
@property (nonatomic, retain) NSDate *modifiedTime;
@property (nonatomic, assign) NSInteger loadoutID;
@property (nonatomic, assign) NSInteger raceID;
@property (nonatomic, assign) NSInteger thumbsTotal;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, assign) NSInteger memberID;

@end

@interface BCEveLoadoutsList : BCRequest {
	NSMutableArray *loadouts;
@private
	BCEveLoadoutsListItem *currentItem;
}
@property (nonatomic, retain) NSArray *loadouts;

+ (id) eveLoadoutsListWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags target:(id)target action:(SEL)action object:(id)object;
+ (id) eveLoadoutsListWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags error:(NSError **)errorPtr;
- (id) initWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags target:(id)target action:(SEL)action object:(id)object;
- (id) initWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags error:(NSError **)errorPtr;

@end