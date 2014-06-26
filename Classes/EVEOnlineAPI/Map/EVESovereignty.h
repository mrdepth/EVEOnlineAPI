//
//  EVESovereignty.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVESovereigntyItem : NSObject<NSCoding>
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic) int32_t allianceID;
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *solarSystemName;
@property (nonatomic) int32_t corporationID;

+ (id) sovereigntyItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVESovereignty : EVERequest
@property (nonatomic, strong) NSArray *solarSystems;

+ (id) sovereigntyWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end