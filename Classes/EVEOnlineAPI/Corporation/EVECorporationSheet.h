//
//  EVECorporationSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorporationSheetDivisionItem : NSObject<NSCoding>
@property (nonatomic) int32_t accountKey;
@property (nonatomic, copy) NSString *description;

+ (id) corporationSheetDivisionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorporationSheetLogo : NSObject<NSCoding>
@property (nonatomic) int32_t graphicID;
@property (nonatomic) int32_t shape1;
@property (nonatomic) int32_t shape2;
@property (nonatomic) int32_t shape3;
@property (nonatomic) int32_t color1;
@property (nonatomic) int32_t color2;
@property (nonatomic) int32_t color3;

@end


@interface EVECorporationSheet : EVERequest
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic, copy) NSString *ticker;
@property (nonatomic) int32_t ceoID;
@property (nonatomic, copy) NSString *ceoName;
@property (nonatomic) int32_t stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *url;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) float taxRate;
@property (nonatomic) int32_t memberCount;
@property (nonatomic) int32_t memberLimit;
@property (nonatomic) int32_t shares;
@property (nonatomic, strong) NSArray *divisions;
@property (nonatomic, strong) NSArray *walletDivisions;
@property (nonatomic, strong) EVECorporationSheetLogo *logo;

+ (id) corporationSheetWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporationID: (int32_t) corporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporationID: (int32_t) corporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end