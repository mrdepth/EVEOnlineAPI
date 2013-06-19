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
		self.moonID = [[attributeDict valueForKey:@"moonID"] longLongValue];
		self.state = (EVEPOSState) [[attributeDict valueForKey:@"state"] integerValue];
		self.stateTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"stateTimestamp"]];
		self.onlineTimestamp = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"onlineTimestamp"]];
	}
	return self;
}

@end


@implementation EVEStarbaseList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) starbaseListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEStarbaseList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/StarbaseList.xml.aspx?keyID=%d&vCode=%@&characterID=%d&version=2", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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

@end