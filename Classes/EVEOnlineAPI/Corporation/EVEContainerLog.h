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
@property (nonatomic) long long itemID;
@property (nonatomic) NSInteger itemTypeID;
@property (nonatomic) NSInteger actorID;
@property (nonatomic, copy) NSString *actorName;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) long long locationID;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *passwordType;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, copy) NSString *oldConfiguration;
@property (nonatomic, copy) NSString *theNewConfiguration;

+ (id) containerLogItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContainerLog : EVERequest
@property (nonatomic, strong) NSArray *containerLog;

+ (id) containerLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
