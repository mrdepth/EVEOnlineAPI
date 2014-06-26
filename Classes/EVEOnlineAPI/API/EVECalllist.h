//
//  EVECalllist.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECalllistCallGroupsItem : NSObject<NSCoding>
@property (nonatomic) int32_t groupID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;

+ (id) callGroupsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECalllistCallsItem : NSObject<NSCoding>
@property (nonatomic) int32_t accessMask;
@property (nonatomic) EVECallType type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic) int32_t groupID;
@property (nonatomic, copy) NSString *description;

+ (id) callsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVECalllist : EVERequest
@property (nonatomic, strong) NSArray *callGroups;
@property (nonatomic, strong) NSArray *calls;

+ (id) calllistWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end