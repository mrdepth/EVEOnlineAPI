//
//  EVEPlanetaryColonies.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVERequest.h"

@interface EVEPlanetaryColoniesItem : NSObject<NSCoding>
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, copy) NSString *solarSystemName;
@property (nonatomic) int32_t planetID;
@property (nonatomic, copy) NSString *planetName;
@property (nonatomic) int32_t planetTypeID;
@property (nonatomic, copy) NSString *planetTypeName;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, copy) NSString *ownerName;
@property (nonatomic, strong) NSDate *lastUpdate;
@property (nonatomic) int32_t upgradeLevel;
@property (nonatomic) int32_t numberOfPins;



+ (id) planetaryColoniesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEPlanetaryColonies : EVERequest
@property (nonatomic, strong) NSArray *colonies;

+ (id) planetaryColoniesWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
