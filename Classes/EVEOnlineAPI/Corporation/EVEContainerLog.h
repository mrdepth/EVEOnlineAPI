//
//  EVEContainerLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContainerLogItem : NSObject<NSCoding>
@property (nonatomic, strong) NSDate *logTime;
@property (nonatomic) int64_t itemID;
@property (nonatomic) int32_t itemTypeID;
@property (nonatomic) int32_t actorID;
@property (nonatomic, copy) NSString *actorName;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) int32_t locationID;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *passwordType;
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t quantity;
@property (nonatomic, copy) NSString *oldConfiguration;
@property (nonatomic, copy) NSString *theNewConfiguration;

+ (id) containerLogItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContainerLog : EVERequest
@property (nonatomic, strong) NSArray *containerLog;

+ (id) containerLogWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
