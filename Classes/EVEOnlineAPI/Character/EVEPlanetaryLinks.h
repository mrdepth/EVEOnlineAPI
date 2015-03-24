//
//  EVEPlanetaryLinks.h
//  Neocom
//
//  Created by Артем Шиманский on 23.03.15.
//  Copyright (c) 2015 Artem Shimanski. All rights reserved.
//

#import "EVERequest.h"

@interface EVEPlanetaryLinksItem : NSObject<NSCoding>
@property (nonatomic) int64_t sourcePinID;
@property (nonatomic) int64_t destinationPinID;
@property (nonatomic) int32_t linkLevel;

+ (id) planetaryLinksItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEPlanetaryLinks : EVERequest
@property (nonatomic, strong) NSArray *links;

+ (id) planetaryLinksWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID planetID:(int32_t) planetID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

