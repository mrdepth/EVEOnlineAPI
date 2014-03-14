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
		self.stationID = [[attributeDict valueForKey:@"stationID"] intValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] intValue];
		self.serviceName = [attributeDict valueForKey:@"serviceName"];
		self.minStanding = [[attributeDict valueForKey:@"minStanding"] floatValue];
		self.surchargePerBadStanding = [[attributeDict valueForKey:@"surchargePerBadStanding"] floatValue];
		self.discountPerGoodStanding = [[attributeDict valueForKey:@"discountPerGoodStanding"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	[aCoder encodeInt32:self.ownerID forKey:@"ownerID"];
	[aCoder encodeObject:self.serviceName forKey:@"serviceName"];
	[aCoder encodeFloat:self.minStanding forKey:@"minStanding"];
	[aCoder encodeFloat:self.surchargePerBadStanding forKey:@"surchargePerBadStanding"];
	[aCoder encodeFloat:self.discountPerGoodStanding forKey:@"discountPerGoodStanding"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		self.ownerID = [aDecoder decodeInt32ForKey:@"ownerID"];
		self.serviceName = [aDecoder decodeObjectForKey:@"serviceName"];
		self.minStanding = [aDecoder decodeFloatForKey:@"minStanding"];
		self.surchargePerBadStanding = [aDecoder decodeFloatForKey:@"surchargePerBadStanding"];
		self.discountPerGoodStanding = [aDecoder decodeFloatForKey:@"discountPerGoodStanding"];
	}
	return self;
}

@end


@implementation EVEOutpostServiceDetail

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostServiceDetailWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID:(int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEOutpostServiceDetail alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID itemID:itemID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID itemID:(int64_t) itemID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostServiceDetail.xml.aspx?keyID=%d&vCode=%@&characterID=%d&itemID=%qi", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID, itemID]]
					   cachePolicy:cachePolicy
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.outpostServiceDetails forKey:@"outpostServiceDetails"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.outpostServiceDetails = [aDecoder decodeObjectForKey:@"outpostServiceDetails"];
	}
	return self;
}

@end