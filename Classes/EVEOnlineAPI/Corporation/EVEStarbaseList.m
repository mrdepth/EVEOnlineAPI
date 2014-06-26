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
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.locationID = [[attributeDict valueForKey:@"locationID"] intValue];
		self.moonID = [[attributeDict valueForKey:@"moonID"] intValue];
		self.state = (EVEPOSState) [[attributeDict valueForKey:@"state"] intValue];
		self.stateTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"stateTimestamp"]];
		self.onlineTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"onlineTimestamp"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.itemID forKey:@"itemID"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt64:self.locationID forKey:@"locationID"];
	[aCoder encodeInt32:self.moonID forKey:@"moonID"];
	[aCoder encodeInt32:self.state forKey:@"state"];
	[aCoder encodeObject:self.stateTimestamp forKey:@"stateTimestamp"];
	[aCoder encodeObject:self.onlineTimestamp forKey:@"onlineTimestamp"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.itemID = [aDecoder decodeInt64ForKey:@"itemID"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.locationID = [aDecoder decodeInt32ForKey:@"locationID"];
		self.moonID = [aDecoder decodeInt32ForKey:@"moonID"];
		self.state = [aDecoder decodeInt32ForKey:@"state"];
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

+ (id) starbaseListWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEStarbaseList alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
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