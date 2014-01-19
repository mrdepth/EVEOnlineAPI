//
//  EVESkillQueue.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESkillQueueItem : NSObject<NSCoding>
@property (nonatomic) NSInteger queuePosition;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger startSP;
@property (nonatomic) NSInteger endSP;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

+ (id) skillQueueItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVESkillQueue : EVERequest
@property (nonatomic, strong) NSArray *skillQueue;
@property (nonatomic, assign, readonly) NSTimeInterval timeLeft;

+ (id) skillQueueWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
