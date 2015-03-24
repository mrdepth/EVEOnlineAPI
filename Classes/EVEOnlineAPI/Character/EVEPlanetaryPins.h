//
//  EVEPlanetaryPins.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVERequest.h"

@interface EVEPlanetaryPinsItem : NSObject<NSCoding>
@property (nonatomic) int64_t pinID;
@property (nonatomic) int32_t typeID;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic) int32_t schematicID;
@property (nonatomic, strong) NSDate *lastLaunchTime;
@property (nonatomic) int32_t cycleTime;
@property (nonatomic) int32_t quantityPerCycle;
@property (nonatomic, strong) NSDate *installTime;
@property (nonatomic, strong) NSDate *expiryTime;
@property (nonatomic) int32_t contentTypeID;
@property (nonatomic, copy) NSString *contentTypeName;
@property (nonatomic) int32_t contentQuantity;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;

+ (id) planetaryPinsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEPlanetaryPins : EVERequest
@property (nonatomic, strong) NSArray *pins;

+ (id) planetaryPinsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

