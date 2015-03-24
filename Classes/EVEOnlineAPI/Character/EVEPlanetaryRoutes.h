//
//  EVEPlanetaryRoutes.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVERequest.h"

@interface EVEPlanetaryRoutesItem : NSObject<NSCoding>
@property (nonatomic) int64_t routeID;
@property (nonatomic) int64_t sourcePinID;
@property (nonatomic) int64_t destinationPinID;
@property (nonatomic) int32_t contentTypeID;
@property (nonatomic, copy) NSString *contentTypeName;
@property (nonatomic) int32_t quantity;
@property (nonatomic) int64_t waypoint1;
@property (nonatomic) int64_t waypoint2;
@property (nonatomic) int64_t waypoint3;
@property (nonatomic) int64_t waypoint4;
@property (nonatomic) int64_t waypoint5;

+ (id) planetaryRoutesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEPlanetaryRoutes : EVERequest
@property (nonatomic, strong) NSArray *routes;

+ (id) planetaryRoutesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

