//
//  EVECharMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharMedals.h"

@implementation EVECharCurrentCorporationMedal
@synthesize medalID;
@synthesize reason;
@synthesize status;
@synthesize issuerID;
@synthesize issued;

+ (id) charCurrentCorporationMedalWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharCurrentCorporationMedal alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] integerValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.status = [attributeDict valueForKey:@"status"];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
	}
	return self;
}

- (void) dealloc {
	[reason release];
	[status release];
	[issued release];
	[super dealloc];
}

@end


@implementation EVECharOtherCorporationsMedal
@synthesize medalID;
@synthesize reason;
@synthesize status;
@synthesize issuerID;
@synthesize issued;
@synthesize corporationID;
@synthesize title;
@synthesize description;

+ (id) charOtherCorporationsMedalWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharOtherCorporationsMedal alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] integerValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.status = [attributeDict valueForKey:@"status"];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.title = [attributeDict valueForKey:@"title"];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

- (void) dealloc {
	[reason release];
	[status release];
	[issued release];
	[title release];
	[description release];
	[super dealloc];
}

@end


@implementation EVECharMedals
@synthesize currentCorporation;
@synthesize otherCorporations;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVECharMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECharMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[currentCorporation release];
	[otherCorporations release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"currentCorporation"]) {
		currentCorporation = [[NSMutableArray alloc] init];
		return currentCorporation;
	}
	else if ([rowset isEqualToString:@"otherCorporations"]) {
		otherCorporations = [[NSMutableArray alloc] init];
		return otherCorporations;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"currentCorporation"]) {
		EVECharCurrentCorporationMedal *charCurrentCorporationMedal = [EVECharCurrentCorporationMedal charCurrentCorporationMedalWithXMLAttributes:attributeDict];
		[currentCorporation addObject:charCurrentCorporationMedal];
		return charCurrentCorporationMedal;
	}
	else if ([rowset isEqualToString:@"otherCorporations"]) {
		EVECharOtherCorporationsMedal *charOtherCorporationsMedal = [EVECharOtherCorporationsMedal charOtherCorporationsMedalWithXMLAttributes:attributeDict];
		[otherCorporations addObject:charOtherCorporationsMedal];
		return charOtherCorporationsMedal;
	}
	return nil;
}

@end