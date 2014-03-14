//
//  EVEOutpostServiceDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEOutpostServiceDetailItem : NSObject<NSCoding>
@property (nonatomic) int32_t stationID;
@property (nonatomic) int32_t ownerID;
@property (nonatomic, copy) NSString *serviceName;
@property (nonatomic) float minStanding;
@property (nonatomic) float surchargePerBadStanding;
@property (nonatomic) float discountPerGoodStanding;

+ (id) outpostServiceDetailItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEOutpostServiceDetail : EVERequest
@property (nonatomic, strong) NSArray *outpostServiceDetails;

+ (id) outpostServiceDetailWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID:(int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID:(int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
