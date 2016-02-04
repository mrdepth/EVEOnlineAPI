//
//  CRFitting.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import "CRFitting.h"

@implementation CRFittingType

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar), @"elementName":@"id"},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)}};
	return scheme;
}

- (NSDictionary*) dictionary {
	NSMutableDictionary* dictionary = [NSMutableDictionary new];
	dictionary[@"id"] = @(self.typeID);
	dictionary[@"name"] = self.name ?: @"";
	dictionary[@"href"] = [NSString stringWithFormat:@"https://crest-tq.eveonline.com/types/%d/", self.typeID];
	return dictionary;
}

@end

@implementation CRFittingItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"type":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[CRFittingType class]},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"flag":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

- (NSDictionary*) dictionary {
	NSMutableDictionary* dictionary = [NSMutableDictionary new];
	dictionary[@"flag"] = @(self.flag);
	dictionary[@"quantity"] = @(self.quantity);
	dictionary[@"type"] = [self.type dictionary] ?: @{};
	return dictionary;
}

@end

@implementation CRFittingCollection

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRFitting class]}};
	return scheme;
}

+ (NSString*) contentType {
	return @"application/vnd.ccp.eve.FittingCollection-v1+json; charset=utf-8";
}

@end

@implementation CRFitting

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"fittingDescription":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"description"},
				   @"name":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"ship":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[CRFittingType class]},
				   @"fittingID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"items":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[CRFittingItem class]}};
	return scheme;
}

- (NSDictionary*) dictionary {
	NSMutableDictionary* dictionary = [NSMutableDictionary new];
	dictionary[@"name"] = self.name ?: NSLocalizedString(@"Unnamed", nil);
	dictionary[@"description"] = self.fittingDescription ?: @"";
	dictionary[@"ship"] = [self.ship dictionary] ?: @{};
	dictionary[@"items"] = [self.items valueForKey:@"dictionary"] ?: @[];
	return dictionary;
}

@end
