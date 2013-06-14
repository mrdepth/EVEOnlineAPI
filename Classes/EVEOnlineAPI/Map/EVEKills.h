//
//  EVEKills.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEKillsItem : NSObject
@property (nonatomic) NSInteger solarSystemID;
@property (nonatomic) NSInteger shipKills;
@property (nonatomic) NSInteger factionKills;
@property (nonatomic) NSInteger podKills;

+ (id) killsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEKills : EVERequest
@property (nonatomic, strong) NSArray *solarSystems;

+ (id) killsWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end