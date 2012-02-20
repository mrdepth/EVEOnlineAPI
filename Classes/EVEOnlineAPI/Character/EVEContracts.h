//
//  EVEContracts.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContractsItem : NSObject {
	long long contractID;
	NSInteger issuerID, issuerCorpID, assigneeID, acceptorID, startStationID, endStationID, forCorp, numDays;
	NSString *title;
	EVEContractType type;
	EVEContractStatus status;
	EVEContractavAilability availability;
	NSDate *dateIssued, *dateExpired, *dateAccepted, *dateCompleted;
	float price, reward, collateral, buyout, volume;
}
@property (nonatomic) long long contractID;
@property (nonatomic) NSInteger issuerID, issuerCorpID, assigneeID, acceptorID, startStationID, endStationID, forCorp, numDays;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) EVEContractType type;
@property (nonatomic) EVEContractStatus status;
@property (nonatomic) EVEContractavAilability availability;
@property (nonatomic, retain) NSDate *dateIssued, *dateExpired, *dateAccepted, *dateCompleted;
@property (nonatomic) float price, reward, collateral, buyout, volume;

+ (id) contractsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

- (NSString*) localizedTypeString;
- (NSString*) localizedStatusString;
- (NSString*) localizedAvailabilityString;

@end

@interface EVEContracts : EVERequest {
	NSMutableArray *contractList;
}
@property (nonatomic, retain) NSArray *contractList;

+ (id) contractsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) contractsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
@end
