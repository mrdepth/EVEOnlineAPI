//
//  EVEAllianceList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAllianceListItem : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic) int32_t executorCorpID;
@property (nonatomic) int32_t memberCount;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSArray *memberCorporations;

+ (id) allianceListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEAllianceListMemberCorporationsItem : NSObject<NSCoding>
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSDate *startDate;

+ (id) allianceListMemberCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEAllianceList : EVERequest
@property (nonatomic, strong) NSArray *alliances;
@property (nonatomic, strong) NSDictionary* alliancesMap;

+ (id) allianceListWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
