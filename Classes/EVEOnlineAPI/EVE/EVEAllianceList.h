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
@property (nonatomic) NSInteger allianceID;
@property (nonatomic) NSInteger executorCorpID;
@property (nonatomic) NSInteger memberCount;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSArray *memberCorporations;

+ (id) allianceListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEAllianceListMemberCorporationsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, strong) NSDate *startDate;

+ (id) allianceListMemberCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEAllianceList : EVERequest
@property (nonatomic, strong) NSArray *alliances;
@property (nonatomic, strong) NSDictionary* alliancesMap;

+ (id) allianceListWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
