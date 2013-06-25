//
//  EVEContractBids.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContractBidsItem : NSObject
@property (nonatomic) long long bidID;
@property (nonatomic) NSInteger contractID;
@property (nonatomic) NSInteger bidderID;
@property (nonatomic, strong) NSDate *dateBid;
@property (nonatomic) float amount;

+ (id) contractBidsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContractBids : EVERequest
@property (nonatomic, strong) NSArray *bidList;

+ (id) contractBidsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
@end
