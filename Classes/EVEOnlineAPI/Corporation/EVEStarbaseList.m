//
//  EVEStarbaseList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEStarbaseList.h"


@implementation EVEStarbaseListItem

+ (id) starbaseListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEStarbaseListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
		self.moonID = [[attributeDict valueForKey:@"moonID"] integerValue];
		self.state = (EVEPOSState) [[attributeDict valueForKey:@"state"] integerValue];
		self.stateTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"stateTimestamp"]];
		self.onlineTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"onlineTimestamp"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.itemID forKey:@"itemID"];
	[aCoder encodeInteger:self.typeID forKey:@"typeID"];
	[aCoder encodeInt64:self.locationID forKey:@"locationID"];
	[aCoder encodeInteger:self.moonID forKey:@"moonID"];
	[aCoder encodeInteger:self.state forKey:@"state"];
	[aCoder encodeObject:self.stateTimestamp forKey:@"stateTimestamp"];
	[aCoder encodeObject:self.onlineTimestamp forKey:@"onlineTimestamp"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.itemID = [aDecoder decodeInt64ForKey:@"itemID"];
		self.typeID = [aDecoder decodeIntegerForKey:@"typeID"];
		self.locationID = [aDecoder decodeInt64ForKey:@"locationID"];
		self.moonID = [aDecoder decodeIntegerForKey:@"moonID"];
		self.state = [aDecoder decodeIntegerForKey:@"state"];
		self.stateTimestamp = [aDecoder decodeObjectForKey:@"stateTimestamp"];
		self.onlineTimestamp = [aDecoder decodeObjectForKey:@"onlineTimestamp"];
	}
	return self;
}

@end


@implementation EVEStarbaseList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEStarbaseList alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/StarbaseList.xml.aspx?keyID=%d&vCode=%@&characterID=%d&version=2", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"starbases"]) {
		self.starbases = [[NSMutableArray alloc] init];
		return self.starbases;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"starbases"]) {
		EVEStarbaseListItem *starbaseListItem = [EVEStarbaseListItem starbaseListItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.starbases addObject:starbaseListItem];
		return starbaseListItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.starbases forKey:@"starbases"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.starbases = [aDecoder decodeObjectForKey:@"starbases"];
	}
	return self;
}

@end