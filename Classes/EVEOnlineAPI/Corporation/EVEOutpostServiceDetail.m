//
//  EVEOutpostServiceDetail.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostServiceDetail.h"


@implementation EVEOutpostServiceDetailItem
@synthesize stationID;
@synthesize ownerID;
@synthesize serviceName;
@synthesize minStanding;
@synthesize surchargePerBadStanding;
@synthesize discountPerGoodStanding;



+ (id) outpostServiceDetailItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEOutpostServiceDetailItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[serviceName release];
	[super dealloc];
}

@end


@implementation EVEOutpostServiceDetail
@synthesize outpostServiceDetails;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostServiceDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr {
	return [[[EVEOutpostServiceDetail alloc] initWithKeyID:keyID vCode:vCode characterID:characterID itemID:itemID error:errorPtr] autorelease];
}

+ (id) outpostServiceDetailWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEOutpostServiceDetail alloc] initWithKeyID:keyID vCode:vCode characterID:characterID itemID:itemID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostServiceDetail.xml.aspx?keyID=%d&vCode=%@&characterID=%d&itemID=%qi", EVEOnlineAPIHost, keyID, vCode, characterID, itemID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID itemID:(long long) itemID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostServiceDetail.xml.aspx?keyID=%d&vCode=%@&characterID=%d&itemID=%qi", EVEOnlineAPIHost, keyID, vCode, characterID, itemID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[outpostServiceDetails release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"outpostServiceDetails"]) {
		outpostServiceDetails = [[NSMutableArray alloc] init];
		return outpostServiceDetails;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"outpostServiceDetails"]) {
		EVEOutpostServiceDetailItem *outpostServiceDetailItem = [EVEOutpostServiceDetailItem outpostServiceDetailItemWithXMLAttributes:attributeDict];
		[outpostServiceDetails addObject:outpostServiceDetailItem];
		return outpostServiceDetailItem;
	}
	return nil;
}

@end