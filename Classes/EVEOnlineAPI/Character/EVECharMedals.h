//
//  EVECharMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharCurrentCorporationMedal : NSObject<NSCoding>
@property (nonatomic) int32_t medalID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) int32_t issuerID;
@property (nonatomic, strong) NSDate *issued;

+ (id) charCurrentCorporationMedalWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharOtherCorporationsMedal : NSObject<NSCoding>
@property (nonatomic) int32_t medalID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) int32_t issuerID;
@property (nonatomic, strong) NSDate *issued;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;

+ (id) charOtherCorporationsMedalWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharMedals : EVERequest
@property (nonatomic, strong) NSArray *currentCorporation;
@property (nonatomic, strong) NSArray *otherCorporations;

+ (id) charMedalsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

