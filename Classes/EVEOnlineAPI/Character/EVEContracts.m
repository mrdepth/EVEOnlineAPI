//
//  EVEContracts.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContracts.h"


@implementation EVEContractsItem


+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"contractID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"issuerID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"issuerCorpID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"assigneeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"acceptorID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"forCorp":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"startStationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"endStationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"numDays":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"title":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"type":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"status":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"availability":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"dateIssued":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"dateExpired":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"dateAccepted":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"dateCompleted":@{@"type":@(EVEXMLSchemePropertyTypeDate)},
				   @"price":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"reward":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"collateral":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"buyout":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"volume":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}
- (NSString*) localizedTypeString {
	switch (self.type) {
		case EVEContractTypeItemExchange:
			return @"Item Exchange";
			break;
		case EVEContractTypeAuction:
			return @"Auction";
			break;
		case EVEContractTypeLoan:
			return @"Loan";
			break;
		case EVEContractTypeCourier:
			return @"Courier";
			break;
	};
	return nil;
}

- (NSString*) localizedStatusString {
	switch (self.status) {
		case EVEContractStatusCompleted:
			return @"Completed";
			break;
		case EVEContractStatusCompletedByIssuer:
			return @"Completed";
			break;
		case EVEContractStatusCompletedByContractor:
			return @"Completed";
			break;
		case EVEContractStatusOutstanding:
			return @"Outstanding";
			break;
		case EVEContractStatusInProgress:
			return @"In Progress";
			break;
		case EVEContractStatusCancelled:
			return @"Cancelled";
			break;
		case EVEContractStatusReversed:
			return @"Reversed";
			break;
		case EVEContractStatusRejected:
			return @"Rejected";
			break;
		case EVEContractStatusFailed:
			return @"Failed";
			break;
		case EVEContractStatusDeleted:
			return @"Deleted";
			break;
	};
	return nil;
}

- (NSString*) localizedAvailabilityString {
	if (self.availability == EVEContractavAilabilityPublic)
		return @"Public";
	else if (self.availability == EVEContractavAilabilityPrivate)
		return @"Private";
	else
		return nil;
}

@end


@implementation EVEContracts

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"contractList":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEContractsItem class]}};
	
	return scheme;
}

@end
