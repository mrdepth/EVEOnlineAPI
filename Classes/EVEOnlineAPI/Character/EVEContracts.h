//
//  EVEContracts.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEContractsItem : EVEObject;
@property (nonatomic) int64_t contractID;
@property (nonatomic) int32_t issuerID, issuerCorpID, assigneeID, acceptorID, forCorp;
@property (nonatomic) int32_t startStationID, endStationID, numDays;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) EVEContractType type;
@property (nonatomic) EVEContractStatus status;
@property (nonatomic) EVEContractavAilability availability;
@property (nonatomic, strong) NSDate *dateIssued, *dateExpired, *dateAccepted, *dateCompleted;
@property (nonatomic) double price, reward, collateral, buyout, volume;

- (NSString*) localizedTypeString;
- (NSString*) localizedStatusString;
- (NSString*) localizedAvailabilityString;

@end

@interface EVEContracts : EVEResult
@property (nonatomic, strong) NSArray *contractList;
@end
