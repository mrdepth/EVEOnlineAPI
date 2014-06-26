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
@property (nonatomic) int32_t queuePosition;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t level;
@property (nonatomic) int32_t startSP;
@property (nonatomic) int32_t endSP;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;

+ (id) skillQueueItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVESkillQueue : EVERequest
@property (nonatomic, strong) NSArray *skillQueue;
@property (nonatomic, assign, readonly) NSTimeInterval timeLeft;

+ (id) skillQueueWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
