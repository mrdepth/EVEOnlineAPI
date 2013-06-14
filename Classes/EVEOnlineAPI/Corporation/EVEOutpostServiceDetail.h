//
//  EVEOutpostServiceDetail.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEOutpostServiceDetailItem : NSObject
@property (nonatomic) NSInteger stationID;
@property (nonatomic) NSInteger ownerID;
@property (nonatomic, copy) NSString *serviceName;
@property (nonatomic) float minStanding;
@property (nonatomic) float surchargePerBadStanding;
@property (nonatomic) float discountPerGoodStanding;

+ (id) outpostServiceDetailItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEOutpostServiceDetail : EVERequest
@property (nonatomic, strong) NSArray *outpostServiceDetails;

+ (id) outpostServiceDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
