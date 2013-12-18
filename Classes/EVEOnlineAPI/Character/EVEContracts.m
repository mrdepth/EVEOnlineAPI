//
//  EVEContracts.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEContracts.h"


@implementation EVEContractsItem

+ (id) contractsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEContractsItem alloc] initWithXMLAttributes:attributeDict];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.contractID forKey:@"contractID"];

	[aCoder encodeInteger:self.issuerID forKey:@"issuerID"];
	[aCoder encodeInteger:self.issuerCorpID forKey:@"issuerCorpID"];
	[aCoder encodeInteger:self.assigneeID forKey:@"assigneeID"];
	[aCoder encodeInteger:self.acceptorID forKey:@"acceptorID"];
	[aCoder encodeInteger:self.startStationID forKey:@"startStationID"];
	[aCoder encodeInteger:self.forCorp forKey:@"forCorp"];
	[aCoder encodeInteger:self.numDays forKey:@"numDays"];

	[aCoder encodeObject:self.title forKey:@"title"];

	[aCoder encodeInteger:self.type forKey:@"type"];
	[aCoder encodeInteger:self.status forKey:@"status"];
	[aCoder encodeInteger:self.availability forKey:@"availability"];

	[aCoder encodeObject:self.dateIssued forKey:@"dateIssued"];
	[aCoder encodeObject:self.dateExpired forKey:@"dateExpired"];
	[aCoder encodeObject:self.dateAccepted forKey:@"dateAccepted"];
	[aCoder encodeObject:self.dateCompleted forKey:@"dateCompleted"];

	[aCoder encodeFloat:self.price forKey:@"price"];
	[aCoder encodeFloat:self.reward forKey:@"reward"];
	[aCoder encodeFloat:self.collateral forKey:@"collateral"];
	[aCoder encodeFloat:self.buyout forKey:@"buyout"];
	[aCoder encodeFloat:self.volume forKey:@"volume"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.contractID = [aDecoder decodeInt64ForKey:@"contractID"];
		
		self.issuerID = [aDecoder decodeIntegerForKey:@"issuerID"];
		self.issuerCorpID = [aDecoder decodeIntegerForKey:@"issuerCorpID"];
		self.assigneeID = [aDecoder decodeIntegerForKey:@"assigneeID"];
		self.acceptorID = [aDecoder decodeIntegerForKey:@"acceptorID"];
		self.startStationID = [aDecoder decodeIntegerForKey:@"startStationID"];
		self.forCorp = [aDecoder decodeIntegerForKey:@"forCorp"];
		self.numDays = [aDecoder decodeIntegerForKey:@"numDays"];

		self.title = [aDecoder decodeObjectForKey:@"title"];

		self.type = [aDecoder decodeIntegerForKey:@"type"];
		self.status = [aDecoder decodeIntegerForKey:@"status"];
		self.availability = [aDecoder decodeIntegerForKey:@"availability"];
		
		self.dateIssued = [aDecoder decodeObjectForKey:@"dateIssued"];
		self.dateExpired = [aDecoder decodeObjectForKey:@"dateExpired"];
		self.dateAccepted = [aDecoder decodeObjectForKey:@"dateAccepted"];
		self.dateCompleted = [aDecoder decodeObjectForKey:@"dateCompleted"];
		
		self.price = [aDecoder decodeFloatForKey:@"price"];
		self.reward = [aDecoder decodeFloatForKey:@"reward"];
		self.collateral = [aDecoder decodeFloatForKey:@"collateral"];
		self.buyout = [aDecoder decodeFloatForKey:@"buyout"];
		self.volume = [aDecoder decodeFloatForKey:@"volume"];
	}
	return self;
}

@end


@implementation EVEContracts

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}


+ (id) contractsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEContracts alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/Contracts.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char"), keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"contractList"]) {
		self.contractList = [[NSMutableArray alloc] init];
		return self.contractList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"contractList"]) {
		EVEContractsItem *contractsItem = [EVEContractsItem contractsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.contractList addObject:contractsItem];
		return contractsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.contractList forKey:@"contractList"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.contractList = [aDecoder decodeObjectForKey:@"contractList"];
	}
	return self;
}

@end
