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
		self.stationID = [[attributeDict valueForKey:@"stationID"] intValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] intValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] intValue];
		self.dockingCostPerShipVolume = [[attributeDict valueForKey:@"dockingCostPerShipVolume"] floatValue];
		self.officeRentalCost = [[attributeDict valueForKey:@"officeRentalCost"] floatValue];
		self.stationTypeID = [[attributeDict valueForKey:@"stationTypeID"] intValue];
		self.reprocessingEfficiency = [[attributeDict valueForKey:@"reprocessingEfficiency"] floatValue];
		self.reprocessingStationTake = [[attributeDict valueForKey:@"reprocessingStationTake"] floatValue];
		self.standingOwnerID = [[attributeDict valueForKey:@"standingOwnerID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	[aCoder encodeInt32:self.ownerID forKey:@"ownerID"];
	[aCoder encodeObject:self.stationName forKey:@"stationName"];
	[aCoder encodeInt32:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeFloat:self.officeRentalCost forKey:@"dockingCostPerShipVolume"];
	[aCoder encodeFloat:self.dockingCostPerShipVolume forKey:@"officeRentalCost"];
	[aCoder encodeInt32:self.stationTypeID forKey:@"stationTypeID"];
	[aCoder encodeFloat:self.reprocessingEfficiency forKey:@"reprocessingEfficiency"];
	[aCoder encodeFloat:self.reprocessingStationTake forKey:@"reprocessingStationTake"];
	[aCoder encodeInt32:self.standingOwnerID	forKey:@"standingOwnerID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		self.ownerID = [aDecoder decodeInt32ForKey:@"ownerID"];
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.solarSystemID = [aDecoder decodeInt32ForKey:@"solarSystemID"];
		self.dockingCostPerShipVolume = [aDecoder decodeFloatForKey:@"dockingCostPerShipVolume"];
		self.officeRentalCost = [aDecoder decodeFloatForKey:@"officeRentalCost"];
		self.stationTypeID = [aDecoder decodeInt32ForKey:@"stationTypeID"];
		self.reprocessingEfficiency = [aDecoder decodeFloatForKey:@"reprocessingEfficiency"];
		self.reprocessingStationTake = [aDecoder decodeFloatForKey:@"reprocessingStationTake"];
		self.standingOwnerID = [aDecoder decodeInt32ForKey:@"standingOwnerID"];
	}
	return self;
}

@end


@implementation EVEOutpostList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostListWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEOutpostList alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.corporationStarbases forKey:@"corporationStarbases"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.corporationStarbases = [aDecoder decodeObjectForKey:@"corporationStarbases"];
	}
	return self;
}

@end