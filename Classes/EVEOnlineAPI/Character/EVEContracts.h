//
//  EVEContracts.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContractsItem : NSObject<NSCoding>
@property (nonatomic) long long contractID;
@property (nonatomic) NSInteger issuerID, issuerCorpID, assigneeID, acceptorID, startStationID, endStationID, forCorp, numDays;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) EVEContractType type;
@property (nonatomic) EVEContractStatus status;
@property (nonatomic) EVEContractavAilability availability;
@property (nonatomic, strong) NSDate *dateIssued, *dateExpired, *dateAccepted, *dateCompleted;
@property (nonatomic) float price, reward, collateral, buyout, volume;

+ (id) contractsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

- (NSString*) localizedTypeString;
- (NSString*) localizedStatusString;
- (NSString*) localizedAvailabilityString;

@end

@interface EVEContracts : EVERequest
@property (nonatomic, strong) NSArray *contractList;

+ (id) contractsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end
