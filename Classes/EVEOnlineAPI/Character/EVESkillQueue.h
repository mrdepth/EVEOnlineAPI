//
//  EVESkillQueue.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESkillQueueItem : NSObject {
	NSInteger queuePosition;
	NSInteger typeID;
	NSInteger level;
	NSInteger startSP;
	NSInteger endSP;
	NSDate *startTime;
	NSDate *endTime;
}
@property (nonatomic) NSInteger queuePosition;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger startSP;
@property (nonatomic) NSInteger endSP;
@property (nonatomic, retain) NSDate *startTime;
@property (nonatomic, retain) NSDate *endTime;

+ (id) skillQueueItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVESkillQueue : EVERequest {
	NSMutableArray *skillQueue;
}
@property (nonatomic, retain) NSArray *skillQueue;

+ (id) skillQueueWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) skillQueueWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
