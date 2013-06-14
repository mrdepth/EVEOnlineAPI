//
//  EVEOutpostList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostList.h"


@implementation EVEOutpostListItem

+ (id) outpostListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEOutpostListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] integerValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.dockingCostPerShipVolume = [[attributeDict valueForKey:@"dockingCostPerShipVolume"] floatValue];
		self.officeRentalCost = [[attributeDict valueForKey:@"officeRentalCost"] floatValue];
		self.stationTypeID = [[attributeDict valueForKey:@"stationTypeID"] integerValue];
		self.reprocessingEfficiency = [[attributeDict valueForKey:@"reprocessingEfficiency"] floatValue];
		self.reprocessingStationTake = [[attributeDict valueForKey:@"reprocessingStationTake"] floatValue];
		self.standingOwnerID = [[attributeDict valueForKey:@"standingOwnerID"] integerValue];
	}
	return self;
}

@end


@implementation EVEOutpostList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEOutpostList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"corporationStarbases"]) {
		self.corporationStarbases = [[NSMutableArray alloc] init];
		return self.corporationStarbases;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"corporationStarbases"]) {
		EVEOutpostListItem *outpostListItem = [EVEOutpostListItem outpostListItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.corporationStarbases addObject:outpostListItem];
		return outpostListItem;
	}
	return nil;
}

@end