//
//  EVELocations.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVELocationsItem : NSObject<NSCoding>
@property (nonatomic) int64_t itemID;
@property (nonatomic, copy) NSString* itemName;
@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;

+ (id) locationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVELocations : EVERequest
@property (nonatomic, strong) NSArray *locations;

+ (id) locationsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
