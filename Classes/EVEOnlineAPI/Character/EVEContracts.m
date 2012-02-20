//
//  EVEContracts.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContracts.h"


@implementation EVEContractsItem
@synthesize contractID;
@synthesize issuerID, issuerCorpID, assigneeID, acceptorID, startStationID, endStationID, forCorp, numDays;
@synthesize title;
@synthesize type;
@synthesize status;
@synthesize availability;
@synthesize dateIssued, dateExpired, dateAccepted, dateCompleted;
@synthesize price, reward, collateral, buyout, volume;

+ (id) contractsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEContractsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.contractID = [[attributeDict valueForKey:@"contractID"] longLongValue];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.issuerCorpID = [[attributeDict valueForKey:@"issuerCorpID"] integerValue];
		self.assigneeID = [[attributeDict valueForKey:@"assigneeID"] integerValue];
		self.acceptorID = [[attributeDict valueForKey:@"acceptorID"] integerValue];
		self.startStationID = [[attributeDict valueForKey:@"startStationID"] integerValue];
		self.endStationID = [[attributeDict valueForKey:@"endStationID"] integerValue];
		self.forCorp = [[attributeDict valueForKey:@"forCorp"] integerValue];
		self.numDays = [[attributeDict valueForKey:@"numDays"] integerValue];
		
		NSString *sType = [attributeDict valueForKey:@"type"];
		
		if ([sType isEqualToString:@"ItemExchange"])
			self.type = EVEContractTypeItemExchange;
		else if ([sType isEqualToString:@"Auction"])
			self.type = EVEContractTypeAuction;
		else if ([sType isEqualToString:@"Loan"])
			self.type = EVEContractTypeLoan;
		else if ([sType isEqualToString:@"Courier"])
			self.type = EVEContractTypeCourier;
		
		NSString *sStatus = [attributeDict valueForKey:@"status"];

		if ([sStatus isEqualToString:@"Outstanding"])
			self.status = EVEContractStatusOutstanding;
		else if ([sStatus isEqualToString:@"InProgress"])
			self.status = EVEContractStatusInProgress;
		else if ([sStatus isEqualToString:@"CompletedByIssuer"])
			self.status = EVEContractStatusCompletedByIssuer;
		else if ([sStatus isEqualToString:@"CompletedByContractor"])
			self.status = EVEContractStatusCompletedByContractor;
		else if ([sStatus isEqualToString:@"Completed"])
			self.status = EVEContractStatusCompleted;
		else if ([sStatus isEqualToString:@"Cancelled"])
			self.status = EVEContractStatusCancelled;
		else if ([sStatus isEqualToString:@"Rejected"])
			self.status = EVEContractStatusRejected;
		else if ([sStatus isEqualToString:@"Failed"])
			self.status = EVEContractStatusFailed;
		else if ([sStatus isEqualToString:@"Deleted"])
			self.status = EVEContractStatusDeleted;
		else if ([sStatus isEqualToString:@"Reversed"])
			self.status = EVEContractStatusReversed;

		self.title = [attributeDict valueForKey:@"title"];
		
		NSString *sAvailability = [attributeDict valueForKey:@"availability"];
		
		if ([sAvailability isEqualToString:@"Public"])
			self.availability = EVEContractavAilabilityPublic;
		if ([sAvailability isEqualToString:@"Private"])
			self.availability = EVEContractavAilabilityPrivate;

		self.dateIssued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"dateIssued"]];
		self.dateExpired = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"dateExpired"]];
		self.dateAccepted = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"dateAccepted"]];
		self.dateCompleted = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"dateCompleted"]];

		self.price = [[attributeDict valueForKey:@"price"] floatValue];
		self.reward = [[attributeDict valueForKey:@"reward"] floatValue];
		self.collateral = [[attributeDict valueForKey:@"collateral"] floatValue];
		self.buyout = [[attributeDict valueForKey:@"buyout"] floatValue];
		self.volume = [[attributeDict valueForKey:@"volume"] floatValue];
	}
	return self;
}

- (void) dealloc {
	[title release];
	[dateIssued release];
	[dateExpired release];
	[dateAccepted release];
	[dateCompleted release];
	[super dealloc];
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
@synthesize contractList;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEContracts alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) contractsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEContracts alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:aObject] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Contracts.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Contracts.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[contractList release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"contractList"]) {
		contractList = [[NSMutableArray alloc] init];
		return contractList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"contractList"]) {
		EVEContractsItem *contractsItem = [EVEContractsItem contractsItemWithXMLAttributes:attributeDict];
		[contractList addObject:contractsItem];
		return contractsItem;
	}
	return nil;
}
@end
