//
//  EVEOutpostServiceDetail.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostServiceDetail.h"


@implementation EVEOutpostServiceDetailItem

+ (id) outpostServiceDetailItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEOutpostServiceDetailItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] integerValue];
		self.serviceName = [attributeDict valueForKey:@"serviceName"];
		self.minStanding = [[attributeDict valueForKey:@"minStanding"] floatValue];
		self.surchargePerBadStanding = [[attributeDict valueForKey:@"surchargePerBadStanding"] floatValue];
		self.discountPerGoodStanding = [[attributeDict valueForKey:@"discountPerGoodStanding"] floatValue];
	}
	return self;
}

@end


@implementation EVEOutpostServiceDetail

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostServiceDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEOutpostServiceDetail alloc] initWithKeyID:keyID vCode:vCode characterID:characterID itemID:itemID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostServiceDetail.xml.aspx?keyID=%d&vCode=%@&characterID=%d&itemID=%qi", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, itemID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"outpostServiceDetails"]) {
		self.outpostServiceDetails = [[NSMutableArray alloc] init];
		return self.outpostServiceDetails;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"outpostServiceDetails"]) {
		EVEOutpostServiceDetailItem *outpostServiceDetailItem = [EVEOutpostServiceDetailItem outpostServiceDetailItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.outpostServiceDetails addObject:outpostServiceDetailItem];
		return outpostServiceDetailItem;
	}
	return nil;
}

@end