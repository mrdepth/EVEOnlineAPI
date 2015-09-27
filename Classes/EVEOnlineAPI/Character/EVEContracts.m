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
				   @"type":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
					   NSString* string = value;
					   if ([string compare:@"ItemExchange" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractTypeItemExchange);
					   else if ([string compare:@"Courier" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractTypeCourier);
					   else if ([string compare:@"Loan" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractTypeLoan);
					   else if ([string compare:@"Auction" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractTypeAuction);
					   else
						   return @(EVEContractTypeUnknown);
				   }},
				   @"status":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"transformer":^(id value) {
					   NSString* string = value;
					   if ([string compare:@"Outstanding" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusOutstanding);
					   else if ([string compare:@"Deleted" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusDeleted);
					   else if ([string compare:@"Completed" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusCompleted);
					   else if ([string compare:@"Failed" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusFailed);
					   else if ([string compare:@"CompletedByIssuer" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusCompletedByIssuer);
					   else if ([string compare:@"CompletedByContractor" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusCompletedByContractor);
					   else if ([string compare:@"Cancelled" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusCancelled);
					   else if ([string compare:@"Rejected" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusRejected);
					   else if ([string compare:@"Reversed" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusReversed);
					   else if ([string compare:@"InProgress" options:NSCaseInsensitiveSearch] == NSOrderedSame)
						   return @(EVEContractStatusInProgress);
					   else
						   return @(EVEContractStatusUnknown);
				   }},
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
		default:
			return @"Unknown Type";
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
		default:
			return @"Unknown";
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
